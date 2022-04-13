json.featured_artworks do
  json.array! @artworks, partial: 'api/v1/items/artworks/artwork', as: :artwork
end