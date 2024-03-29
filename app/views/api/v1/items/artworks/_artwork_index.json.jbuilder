# frozen_string_literal: true

json.id artwork.id
json.name artwork.name
json.featured_image url(artwork&.artwork_images&.select { |f| f.featured_image == true }&.first&.image)
json.images_included artwork.images
json.views artwork.views
