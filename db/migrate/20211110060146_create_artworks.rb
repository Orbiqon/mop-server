# frozen_string_literal: true

class CreateArtworks < ActiveRecord::Migration[6.1]
  def change
    create_table :artworks do |t|
      t.references :user
      t.string :name
      t.text :notes
      t.string :edition_type
      t.integer :edition_quantity, default: nil
      t.boolean :sellable
      t.boolean :exhibitionable
      t.boolean :status
      t.timestamps
    end
  end
end
