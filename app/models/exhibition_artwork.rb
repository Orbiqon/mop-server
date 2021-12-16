# frozen_string_literal: true

class ExhibitionArtwork < ApplicationRecord
  belongs_to :artwork
  belongs_to :exhibition
end
