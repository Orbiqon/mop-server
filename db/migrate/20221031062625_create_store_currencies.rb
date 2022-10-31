class CreateStoreCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :store_currencies do |t|
      t.string :name
      t.timestamps
    end
  end
end
