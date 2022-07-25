# frozen_string_literal: true

class Exhibition < ApplicationRecord
  validates :room_name, presence: true
  validates :status, inclusion: { in: [true, false], message: 'must be Boolean' }
  validates :draft, inclusion: { in: [true, false], message: 'must be Boolean' }

  before_create :add_key

  def add_key
    self.key = rand(32**8).to_s(32) if draft == false
  end

  belongs_to :exhibition_style
  belongs_to :gallery

  has_many :exhibition_artworks, dependent: :destroy
  has_many :artworks, through: :exhibition_artworks
  
  has_one_attached :image
  
  scope :draft, ->(value) { where(draft: value) if value.present? }
  scope :status, -> { where(status: true) }
  
  def artwork_images
    artworks.map(&:artwork_images).flatten
  end
end
