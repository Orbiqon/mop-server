# frozen_string_literal: true

json.id artwork.id
json.name artwork.name
json.artist_name artwork.user&.full_name
json.featured_image url(artwork&.artwork_images&.select { |f| f.featured_image == true }&.first&.image)
