# frozen_string_literal: true

json.id gallery.id
json.name gallery.name
json.artist_name gallery&.artist_name
json.gallery_type gallery&.gallery_type
json.domain gallery&.domain
json.welcome_video gallery&.welcome_video
json.logo url(gallery&.logo)
json.watermark url(gallery&.watermark)
