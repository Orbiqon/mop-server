# frozen_string_literal: true

class Exhibition < ApplicationRecord
  validates :room_name, presence: true
  validates :status, inclusion: { in: [true, false], message: 'must be Boolean' }
  validates :draft, inclusion: { in: [true, false], message: 'must be Boolean' }

  before_create :add_key

  def add_key
    self.key = rand(32**8).to_s(32) if draft == false
  end

  has_one :exhibition_style

  has_many :exhibition_artworks
  has_many :artworks, through: :exhibition_artworks

  scope :draft, ->(value) { where(draft: value) if value.present? }
end
