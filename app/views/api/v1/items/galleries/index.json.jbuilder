# frozen_string_literal: true

json.galleries do
  json.array! @galleries, partial: 'api/v1/items/galleries/gallery', as: :gallery
end

json.pagination do
  json.partial! 'api/v1/shared/pagination', collection: @galleries
end
