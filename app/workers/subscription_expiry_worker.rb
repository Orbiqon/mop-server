# frozen_string_literal: true

class SubscriptionExpiryWorker
  include Sidekiq::Worker
  sidekiq_options queue: :low, retry: false, backtrace: true

  def perform(subscription_id)
    Rails.logger.info("Processing Subscription record #{subscription_id}")
    subscription = Subscription.find_by(id: subscription_id)
    return unless subscription

    subscription.update(status: false)
  end
end
