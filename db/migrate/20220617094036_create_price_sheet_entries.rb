class CreatePriceSheetEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :price_sheet_entries do |t|
      t.references :price_sheet
      t.integer :paper_one, default: nil
      t.integer :paper_two, default: nil
      t.integer :size
      t.string :price
      t.timestamps
    end
  end
end
