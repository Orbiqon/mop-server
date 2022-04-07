json.gallery do
  json.gallery_name @exhibition&.gallery&.name
  json.welcome_video @exhibition&.gallery&.welcome_video
end

json.artist do
  json.artist_name @exhibition&.gallery&.user&.full_name
end

json.exhibition do
  json.id @exhibition.id
  json.room_name @exhibition.room_name
  json.image url(@exhibition.image)
  json.views @exhibition.views
end

json.artwork do
  json.array! @exhibition.artworks, partial: "api/v1/items/artworks/artwork_detail", as: :artwork
end