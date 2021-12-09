# frozen_string_literal: true

class Room < ApplicationRecord
  belongs_to :gallery

  has_and_belongs_to_many :artworks
  accepts_nested_attributes_for :artworks
end
