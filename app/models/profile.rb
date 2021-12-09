# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :styles

  has_one_attached :avatar
  has_one_attached :cover
  has_one_attached :welcome_video

  accepts_nested_attributes_for :styles
end
