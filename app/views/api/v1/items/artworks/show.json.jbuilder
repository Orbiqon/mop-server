# frozen_string_literal: true

json.partial! 'api/v1/items/artworks/artwork_detail', artwork: @artwork

json.more_by_this_artist do
  json.array! @artwork.user.artworks, partial: 'api/v1/items/artworks/artwork_detail', as: :artwork
end
