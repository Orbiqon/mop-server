# frozen_string_literal: true

json.id gallery.id
json.gallery_name gallery&.name
json.artist_name gallery&.user&.profile&.full_name
json.views gallery&.views
json.image url(gallery&.exhibitions&.max_by(&:views)&.image)
