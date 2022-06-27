class AddColumnsToOrderItem < ActiveRecord::Migration[6.1]
  def up
    add_column :order_items, :size, :string
    add_column :order_items, :paper, :string
    add_column :order_items, :frame, :string
    add_column :order_items, :mount_size, :string
  end
  
  def down
    remove_column :order_items, :size
    remove_column :order_items, :paper
    remove_column :order_items, :frame
    remove_column :order_items, :mount_size
  end
end
