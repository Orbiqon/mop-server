class ArtworkImage < ApplicationRecord
  enum orientation: {
    landscape: 0,
    portrait: 1,
    square: 2
  }

  belongs_to :artwork
  has_one_attached :image
end
