class CreateJoinTableRoomArtwork < ActiveRecord::Migration[6.1]
  def change
    create_join_table :rooms, :artworks do |t|
      t.index [:room_id, :artwork_id]
      t.index [:artwork_id, :room_id]
    end
  end
end
