class AddColumnToOrderItems < ActiveRecord::Migration[6.1]
  def up
    add_column :order_items, :price, :decimal, precision: 10, scale: 2
  end
  
  def down
    remove_column :order_items, :price
  end
end
