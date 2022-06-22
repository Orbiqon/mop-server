class AddPriceColumnToArtwork < ActiveRecord::Migration[6.1]
  def up
    add_reference :artworks, :price_sheet
  end
  
  def down
    remove_reference :artworks, :price_sheet
  end
end
