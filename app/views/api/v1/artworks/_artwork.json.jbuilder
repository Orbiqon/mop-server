# frozen_string_literal: true

json.id artwork.id
json.user_id artwork.user_id
json.name artwork.name
json.edition_type artwork.edition_type
json.edition_quantity artwork.edition_quantity
json.sellable artwork.sellable
json.exhibitionable artwork.exhibitionable
json.styles artwork.styles
json.colours artwork.colours

json.images do
  json.array! artwork.artwork_images, partial: 'api/v1/artworks/artwork_images', as: :artwork_image
end
