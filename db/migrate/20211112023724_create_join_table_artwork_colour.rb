class CreateJoinTableArtworkColour < ActiveRecord::Migration[6.1]
  def change
    create_join_table :artworks, :colours do |t|
      t.index %i[artwork_id colour_id]
      t.index %i[colour_id artwork_id]
    end
  end
end
