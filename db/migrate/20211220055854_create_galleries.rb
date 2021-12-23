# frozen_string_literal: true

class CreateGalleries < ActiveRecord::Migration[6.1]
  def change
    create_table :galleries do |t|
      t.references :user
      t.string :name
      t.string :artist_name
      t.integer :gallery_type
      t.string :domain
      t.string :welcome_video
      t.timestamps
    end
  end
end
