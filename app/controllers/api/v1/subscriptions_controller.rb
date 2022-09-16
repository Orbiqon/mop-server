module Api
  module V1
    class SubscriptionsController < ApiController
      def create
        package = Package.find(params[:package_id])
        token = params[:token]
        service = StripeService.new(current_user, package)
        service.create_stripe_user(token, 'artist')
        result = service.process_payment(package.price)

        return raise_error('Stripe Payment Error', result.failure[:message], 422) if result&.failure?

        current_user.subscriptions.create(subscription_params(package, result.success[:charge].id))

        json_response({ message: 'Sucessfully subscribed', user: current_user })
      end

      private

      def subscription_params(package, charge_id)
        {}.tap do |p|
          p[:user_id] = current_user.id
          p[:package_id] = package.id
          p[:start_date] = Time.now
          p[:end_date] = package.calculate_end_date
          p[:status] = true
          p[:on_trial] = false
          p[:renew] = true
          p[:charge_id] = charge_id
        end
      end
    end
  end
end



#####################
# Order Controller
#####################

# current_user # customer
# token = params[:token]
# service = StripeService.new(current_user)
# service.create_stripe_user(token)
# result = service.process_payment(ORDER_AMOUNT)

# return raise_error('Stripe Payment Error', result.failure[:message], 422) if result&.failure?

# Order.create

# json_response({ message: 'Order Complete' })