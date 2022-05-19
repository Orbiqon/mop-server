class CreateArtistSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :artist_settings do |t|
      t.references :user
      t.string :payment_method
      t.string :store_currency
      t.string :order_delay
      t.text :terms_of_service
      t.text :digital_image_licence
      t.timestamps
    end
  end
end
