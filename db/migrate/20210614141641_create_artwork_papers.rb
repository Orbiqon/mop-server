class CreateArtworkPapers < ActiveRecord::Migration[6.1]
  def change
    create_table :artwork_papers do |t|
      t.references :artwork, foreign_key: true
      t.references :paper, foreign_key: true
      t.float :base_price, default: 0.0
      t.timestamps
    end
  end
end
