json.artists do
  json.array! @artists, partial: 'api/v1/items/artists/artist', as: :artist
end