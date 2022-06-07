# frozen_string_literal: true

# json.id artwork.id
# json.name artwork.name
# json.artist_name artwork.user&.full_name
# json.notes artwork.notes

json.images do
  json.array! artwork.artwork_images, partial: 'api/v1/items/artworks/artwork_images', as: :artwork_image
end
