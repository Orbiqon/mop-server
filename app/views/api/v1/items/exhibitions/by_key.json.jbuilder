json.exhibition_detail do
  json.gallery_name @exhibition&.gallery&.name
  json.artist_name @exhibition&.gallery&.user&.full_name
  json.room_name @exhibition&.room_name
  json.image url(@exhibition&.image)
  json.style @exhibition&.exhibition_style&.name
  
end

json.artwork_images do
  json.array! @exhibition&.artwork_images, partial: "api/v1/items/exhibitions/artwork_images", as: :artwork_image
end 
