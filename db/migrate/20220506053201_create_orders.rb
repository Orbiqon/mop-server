class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.text :address_1  
      t.text :address_2  
      t.text :address_3
      t.string :postcode
      t.string :country  
      t.text :shipping_address_1
      t.text :shipping_address_2
      t.text :shipping_address_3
      t.text :shipping_postcode
      t.text :shipping_country
      t.string :price
      t.timestamps
    end
  end
end
