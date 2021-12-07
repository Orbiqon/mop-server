json.artworks do
  json.array! @artworks, partial: 'api/v1/artworks/artwork', as: :artwork
end

json.pagination do
  json.partial! 'api/v1/shared/pagination', collection: @artworks
end
