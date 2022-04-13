# frozen_string_literal: true

json.id artist.id
json.artist_name artist&.full_name
json.image url(artist&.profile&.picture)