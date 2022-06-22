class CreateMouldings < ActiveRecord::Migration[6.1]
  def change
    create_table :mouldings do |t|
      t.string :name
      t.timestamps
    end
  end
end
