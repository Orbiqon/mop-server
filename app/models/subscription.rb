# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :package

  scope :of_status, ->(status) { where(status: status) if status.present? }
  scope :recent, -> { last }

  after_create :set_expiry
  # after_create :subscription_created
  # after_update :subscription_expired

  def set_expiry
    return if on_trial

    return if end_date.nil?

    job_id = SubscriptionExpiryWorker.perform_at(end_date, id)
    update(job_id: job_id)
  end

  def subscription_created
    SubscriptionMailer.subscription_created(id).deliver
  end

  def subscription_expired
    SubscriptionMailer.subscription_expired(id).deliver if saved_change_to_status? && status == false
    renew_subscription if saved_change_to_status? && status == false && renew?
  end

  def renew_subscription
    service = StripeService.new(user, package)
    result = service.process_payment(package.price)

    return if result.failure?

    new_subscription = Subscription.create!(subscription_params(self, package, result.success[:charge].id))
    new_subscription.set_expiry
  end

  def subscription_params(subscription, package, charge_id)
    {}.tap do |p|
      p[:user_id] = subscription.user_id
      p[:package_id] = package.id
      p[:start_date] = Time.now
      p[:end_date] = package.calculate_end_date
      p[:status] = true
      p[:on_trial] = false
      p[:renew] = subscription.renew
      p[:charge_id] = charge_id
    end
  end
end
