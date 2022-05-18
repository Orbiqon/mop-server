class AddColumnToOrderItem < ActiveRecord::Migration[6.1]
  def up
    add_column :order_items, :user_id, :integer
  end
  
  def down
    remove_column :order_items, :user_id
  end
end
