# frozen_string_literal: true

class CreateColours < ActiveRecord::Migration[6.1]
  def change
    create_table :colours do |t|
      t.string :name
      t.boolean :status, default: 0
      t.timestamps
    end
  end
end
