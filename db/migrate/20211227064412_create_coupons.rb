# frozen_string_literal: true

class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.references :user
      t.string(:code, null: false)
      t.string(:description)
      t.date(:valid_from)
      t.date(:valid_until, null: false)
      t.integer(:redemption_limit, default: 1)
      t.integer(:coupon_redemptions_count, default: 0)
      t.integer(:amount, default: 0)
      t.integer(:amount_type)

      t.timestamps
    end
  end
end
