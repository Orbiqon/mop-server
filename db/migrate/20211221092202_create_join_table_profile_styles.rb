# frozen_string_literal: true

class CreateJoinTableProfileStyles < ActiveRecord::Migration[6.1]
  def change
    create_join_table :profiles, :styles do |t|
      t.index %i[profile_id style_id]
      t.index %i[style_id profile_id]
    end
  end
end
