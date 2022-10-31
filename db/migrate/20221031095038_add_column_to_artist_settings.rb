class AddColumnToArtistSettings < ActiveRecord::Migration[6.1]
  def change
    add_column :artist_settings, :self_fullfill_msg, :text
    add_column :artist_settings, :star_review, :string
    add_column :artist_settings, :feedback, :text
  end
end
