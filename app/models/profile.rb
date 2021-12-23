# frozen_string_literal: true

class Profile < ApplicationRecord
  has_one_attached :picture

  belongs_to :user

  has_and_belongs_to_many :styles
  accepts_nested_attributes_for :styles
end
