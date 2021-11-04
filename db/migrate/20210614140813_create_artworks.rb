class CreateArtworks < ActiveRecord::Migration[6.1]
  def change
    create_table :artworks do |t|
      t.string :name
      t.text :description
      t.boolean :landspace, default: false
      t.boolean :sellable, default: false
      t.boolean :fullfil, default: false
      t.boolean :live, default: false
      t.boolean :exhibit, default: false
      t.float :base_price, default: 0.0
      t.integer :quantity, default: 0
      t.text :notes

      t.timestamps
    end
  end
end
