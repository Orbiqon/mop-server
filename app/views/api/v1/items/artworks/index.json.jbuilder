# frozen_string_literal: true

json.artworks do
  json.array! @artworks, partial: 'api/v1/items/artworks/artwork_index', as: :artwork
end

json.pagination do
  json.partial! 'api/v1/shared/pagination', collection: @artworks
end
