class ChangeColumnNameInOrders < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :price, :total_price
  end
end
