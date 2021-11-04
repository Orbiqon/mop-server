class CreateGalleries < ActiveRecord::Migration[6.1]
  def change
    create_table :galleries do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :title
      t.string :welcome_video
      t.references :style, foreign_key: true
      t.references :frame, foreign_key: true
      t.string :link
      t.timestamps
    end
  end
end
