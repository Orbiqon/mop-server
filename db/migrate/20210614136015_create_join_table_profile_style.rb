class CreateJoinTableProfileStyle < ActiveRecord::Migration[6.1]
  def change
    create_join_table :profiles, :styles do |t|
      t.index [:profile_id, :style_id]
      t.index [:style_id, :profile_id]
    end
  end
end
