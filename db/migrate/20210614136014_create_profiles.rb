class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :description
      t.string :inspiration
      t.integer :experience
      t.timestamps
    end
  end
end
