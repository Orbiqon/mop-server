# frozen_string_literal: true

class CreateStyles < ActiveRecord::Migration[6.1]
  def change
    create_table :styles do |t|
      t.string :name
      t.boolean :status, default: 0
      t.timestamps
    end
  end
end
