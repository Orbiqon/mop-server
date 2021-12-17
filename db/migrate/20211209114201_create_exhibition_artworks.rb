# frozen_string_literal: true

class CreateExhibitionArtworks < ActiveRecord::Migration[6.1]
  def change
    create_table :exhibition_artworks do |t|
      t.references :exhibition
      t.references :artwork
      t.timestamps
    end
  end
end
