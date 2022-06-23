# frozen_string_literal: true

json.id artwork.id
json.name artwork.name
json.artist_name artwork.user&.full_name
json.notes artwork.notes

json.images do
  json.array! artwork.artwork_images, partial: 'api/v1/items/artworks/artwork_images', as: :artwork_image
end

json.price_sheet do
  json.sizes artwork.price_sheet.price_sheet_entries.map{ |e| Size.where(id: e.size) }.flatten
  json.frames Frame.all
  json.mount Mount.all
  json.print_material nil
  json.price nil
end