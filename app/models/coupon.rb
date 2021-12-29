# frozen_string_literal: true

class Coupon < ApplicationRecord
  validates :code, uniqueness: true, presence: true
  validates :valid_from, presence: true
  validates :valid_until, presence: true, if: :after_valid_from?

  def after_valid_from?
    errors.add(:valid_until, "can't be less than valid from") if valid_until < valid_from
  end

  enum amount_type: {
    price: 0,
    percentage: 1
  }

  belongs_to :user
end
