class CreateJoinTableArtworkCategory < ActiveRecord::Migration[6.1]
  def change
    create_join_table :artworks, :categories do |t|
      t.index %i[artwork_id category_id]
      t.index %i[category_id artwork_id]
    end
  end
end
