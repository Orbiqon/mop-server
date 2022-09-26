# frozen_string_literal: true

json.id artwork.id
json.user_id artwork.user_id
json.name artwork.name
json.edition_type artwork.edition_type
json.edition_quantity artwork.edition_quantity
json.sellable artwork.sellable
json.sell_via artwork.sell_via
json.exhibitionable artwork.exhibitionable

json.styles artwork.styles do |style|
  json.id style.id
  json.name style.name
end
json.colours artwork.colours do |colour|
  json.id colour.id
  json.name colour.name
end

if artwork.price_sheet
  json.price_sheet do
    json.id artwork&.price_sheet&.id
    json.name artwork&.price_sheet&.name
    json.entries artwork.price_sheet.price_sheet_entries do |entry|
      json.id entry&.id
    #   json.paper_one Paper.find_by(id: entry.paper_one).name 
    #   json.paper_two Paper.find_by(id: entry.paper_two).name
      json.size Size.find_by(id: entry&.size)&.name
      json.price entry&.price
    end
  end
end

json.images do
  json.array! artwork.artwork_images, partial: 'api/v1/artworks/artwork_images', as: :artwork_image
end
