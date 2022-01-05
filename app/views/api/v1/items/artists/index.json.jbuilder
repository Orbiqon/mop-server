# frozen_string_literal: true

json.artists do
  json.array! @artists, partial: 'api/v1/items/artists/artist', as: :artist
end

json.pagination do
  json.partial! 'api/v1/shared/pagination', collection: @artists
end
