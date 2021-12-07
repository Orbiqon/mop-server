class CreateArtworkImages < ActiveRecord::Migration[6.1]
  def change
    create_table :artwork_images do |t|
      t.references :artwork
      t.integer :orientation
      t.integer :sequence, default: nil
      t.timestamps
    end
  end
end
