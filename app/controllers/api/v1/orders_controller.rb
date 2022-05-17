module Api
  module V1
    class OrdersController < ApiController
      def create
        token = params[:token]
        service = StripeService.new(current_user)
        service.create_stripe_user(token, 'customer')
        result = service.process_payment(order_params[:total_price].to_i)

        return raise_error('Stripe Payment Error', result.failure[:message], 422) if result&.failure?
        
        @order = Order.create(order_params)
        json_response({ message: 'Your Order is completed.' }) if @order.save
      end
      
      private
        
      def order_params
        params.require(:order).permit(:user_id, :first_name, :last_name, :phone_number ,:address_1, :address_2, :address_3, :postcode,:country, :shipping_address_1, :shipping_address_2, :shipping_address_3, :shipping_postcode, :shipping_country, :total_price, 
        order_items_attributes: %i[artwork_id quantity price])
      end
    end
  end
end
