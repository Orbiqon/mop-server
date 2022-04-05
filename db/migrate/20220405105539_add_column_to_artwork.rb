class AddColumnToArtwork < ActiveRecord::Migration[6.1]
  def up
    add_column :artworks, :views, :integer, default: 0
  end

  def down
    remove_column :artworks, :views
  end
end
