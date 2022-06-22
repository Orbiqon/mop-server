class CreateMounts < ActiveRecord::Migration[6.1]
  def change
    create_table :mounts do |t|
      t.string :name
      t.timestamps
    end
  end
end
