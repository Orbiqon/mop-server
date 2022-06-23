# frozen_string_literal: true

json.partial! 'api/v1/items/artworks/artwork', artwork: @artwork

json.more_by_this_artist do
  json.array! @artwork.user.artworks.last(4), partial: 'api/v1/items/artworks/artwork_detail', as: :artwork
end
