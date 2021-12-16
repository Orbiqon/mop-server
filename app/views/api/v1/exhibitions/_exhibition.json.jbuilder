# frozen_string_literal: true

json.id exhibition.id
json.room_name exhibition.room_name
json.artist_name exhibition&.artist_name
json.draft exhibition.draft
json.status exhibition.status
json.key exhibition.key

json.exhibition_style do
  json.partial! 'api/v1/exhibition_styles/exhibition_style', style: ExhibitionStyle.find_by(id: exhibition.exhibition_style_id)
end

json.artworks do
  json.array! exhibition.artworks, partial: 'api/v1/artworks/artwork', as: :artwork
end
