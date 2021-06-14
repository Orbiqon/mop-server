class CreatePackages < ActiveRecord::Migration[6.1]
  def change
    create_table :packages do |t|
      t.string :name
      t.string :description
      t.boolean :enable
      t.float :price
      t.integer :duration_type
      t.integer :duration_span
      t.integer :trial, default: 0
      t.timestamps
    end
  end
end
