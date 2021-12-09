# frozen_string_literal: true

class CreateJoinTableArtworkStyle < ActiveRecord::Migration[6.1]
  def change
    create_join_table :artworks, :styles do |t|
      t.index %i[artwork_id style_id]
      t.index %i[style_id artwork_id]
    end
  end
end
