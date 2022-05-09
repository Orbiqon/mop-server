module Api
  module V1
    module Items
      class OrdersController < ItemsController
        def create
          @order = Order.create(order_params)
          @order.save
        end
        
        private
        
        def order_params
          params.require(:order).permit(:user_id, :first_name, :last_name, :phone_number ,:address_1, :address_2, :address_3, :postcode,:country, :shipping_address_1, :shipping_address_2, :shipping_address_3, :shipping_postcode, :shipping_country, :price, 
          order_items_attributes: %i[artwork_id quantity])
        end
      end
    end
  end
end
