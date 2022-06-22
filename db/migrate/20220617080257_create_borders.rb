class CreateBorders < ActiveRecord::Migration[6.1]
  def change
    create_table :borders do |t|
      t.string :name
      t.timestamps
    end
  end
end
