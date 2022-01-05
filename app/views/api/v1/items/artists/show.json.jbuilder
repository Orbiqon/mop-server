# frozen_string_literal: true

json.partial! 'api/v1/items/artists/artist_exhibitions', artist: @artist

json.exhibitions do
  json.array! @artist.exhibitions, partial: 'api/v1/items/exhibitions/exhibition', as: :exhibition
end
