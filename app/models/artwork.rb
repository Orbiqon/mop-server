# frozen_string_literal: true

class Artwork < ApplicationRecord
  enum sell_via: {
    with_us: 0,
    self_fulfil: 1
  }

  validates :name, presence: true
  validates :sellable, inclusion: { in: [true, false], message: 'must be Boolean' }
  validates :exhibitionable, inclusion: { in: [true, false], message: 'must be Boolean' }
  validates :status, inclusion: { in: [true, false], message: 'must be Boolean' }
  validates :edition_quantity, numericality: true, if: :type_limited?

  def type_limited?
    edition_type == 'limited'
  end

  belongs_to :user

  has_and_belongs_to_many :styles, dependent: :destroy
  accepts_nested_attributes_for :styles

  has_and_belongs_to_many :colours, dependent: :destroy
  accepts_nested_attributes_for :colours

  has_many :artwork_images, dependent: :destroy
  accepts_nested_attributes_for :artwork_images

  has_many :exhibition_artworks
  has_many :exhibitions, through: :exhibition_artworks

  scope :sellable, ->(value) { where(sellable: value) if value }
  scope :exhibitionable, ->(value) { where(exhibitionable: value) if value }

  def images
    artwork_images.count
  end
end
