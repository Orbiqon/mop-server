class TrialExpireWorker
  include Sidekiq::Worker
  sidekiq_options queue: :low, retry: false, backtrace: true

  def perform(subscription_id)
    subscription = Subscription.find_by(id: subscription_id)
    package = subscription.package

    service = StripeService.new(subscription.user, package)
    result = service.process_payment(package.price)

    return if result.failure?

    subscription.update(
      start_date: Time.now, end_date: package.calculate_end_date,
      on_trial: false, charge_id: result.success[:charge].id
    )

    subscription.set_expiry
  end
end
