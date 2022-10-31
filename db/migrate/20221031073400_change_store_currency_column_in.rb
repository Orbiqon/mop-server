class ChangeStoreCurrencyColumnIn < ActiveRecord::Migration[6.1]
  def change
    remove_column :artist_settings, :store_currency
    add_reference :artist_settings, :store_currency
  end
end
