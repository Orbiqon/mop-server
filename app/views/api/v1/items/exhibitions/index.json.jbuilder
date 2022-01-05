# frozen_string_literal: true

json.exhibitions do
  json.array! @exhibitions, partial: 'api/v1/items/exhibitions/exhibition', as: :exhibition
end

json.pagination do
  json.partial! 'api/v1/shared/pagination', collection: @exhibitions
end
