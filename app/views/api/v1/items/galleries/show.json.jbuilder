# frozen_string_literal: true

json.partial! 'api/v1/items/galleries/gallery', gallery: @gallery

json.exhibitions do
  json.array! @gallery.exhibitions, partial: 'api/v1/exhibitions/exhibition', as: :exhibition
end
