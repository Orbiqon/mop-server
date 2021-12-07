class Artwork < ApplicationRecord
  validates :name, presence: true
  validates :sellable, inclusion: { in: [true, false], message: 'must be Boolean' }
  validates :exhibitionable, inclusion: { in: [true, false], message: 'must be Boolean' }
  validates :status, inclusion: { in: [true, false], message: 'must be Boolean' }
  validates :edition_quantity, numericality: true, if: :is_type_limited?

  def is_type_limited?
    edition_type == 'limited'
  end

  belongs_to :user

  has_and_belongs_to_many :styles
  accepts_nested_attributes_for :styles

  has_and_belongs_to_many :colours
  accepts_nested_attributes_for :colours

  has_many :artwork_images, dependent: :destroy
  accepts_nested_attributes_for :artwork_images

  scope :sellable, ->(value) { where(sellable: value) if value }
  scope :exhibitionable, ->(value) { where(exhibitionable: value) if value }
end
