class CreatePriceSheets < ActiveRecord::Migration[6.1]
  def change
    create_table :price_sheets do |t|
      t.string :name
      t.timestamps
    end
  end
end
