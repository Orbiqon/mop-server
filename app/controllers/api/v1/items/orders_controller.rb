module Api
  module V1
    module Items
      class OrdersController < ItemsController
        def create
          # byebug
          # token = params[:token]
          # user = User.find_by(id: params[:user_id])
          # service = StripeService.new(user)
          # service.create_stripe_user(token, 'customer')
          # result = service.process_payment(params[:total_price])

          # return raise_error('Stripe Payment Error', result.failure[:message], 422) if result&.failure?
          
          @order = Order.create(order_params)
          json_response({ message: 'Sucessfully subscribed' }) if @order.save
        end
        
        private
        
        def order_params
          params.require(:order).permit(:user_id, :first_name, :last_name, :phone_number ,:address_1, :address_2, :address_3, :postcode,:country, :shipping_address_1, :shipping_address_2, :shipping_address_3, :shipping_postcode, :shipping_country, :total_price, 
          order_items_attributes: %i[artwork_id quantity price])
        end
      end
    end
  end
end
