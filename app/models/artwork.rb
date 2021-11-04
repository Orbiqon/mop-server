class Artwork < ApplicationRecord
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :styles

  has_many :artwork_sizes
  has_many :sizes, through: :artwork_sizes

  has_many :artwork_frames
  has_many :frames, through: :artwork_frames

  has_many :artwork_papers
  has_many :papers, through: :artwork_papers

  accepts_nested_attributes_for :categories
  accepts_nested_attributes_for :styles
  accepts_nested_attributes_for :sizes
  accepts_nested_attributes_for :frames
  accepts_nested_attributes_for :papers
end
