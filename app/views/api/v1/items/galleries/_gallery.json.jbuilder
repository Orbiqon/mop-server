# frozen_string_literal: true

json.id gallery.id
json.gallery_name gallery&.name
json.artist_name gallery&.user&.profile&.full_name
json.logo url(gallery&.logo)
json.watermark url(gallery&.watermark)
json.views gallery&.views
