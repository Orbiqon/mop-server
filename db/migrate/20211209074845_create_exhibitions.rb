# frozen_string_literal: true

class CreateExhibitions < ActiveRecord::Migration[6.1]
  def change
    create_table :exhibitions do |t|
      t.references :user
      t.references :exhibition_style
      t.string :room_name
      t.string :artist_name
      t.boolean :draft, default: 0
      t.boolean :status, default: 0
      t.string :key
      t.timestamps
    end
  end
end
