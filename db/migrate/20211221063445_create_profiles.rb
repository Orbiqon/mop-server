# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :first_name
      t.string :surname
      t.string :company_name
      t.string :phone_number
      t.text :bio
      t.json :social_account
      t.timestamps
    end
  end
end
