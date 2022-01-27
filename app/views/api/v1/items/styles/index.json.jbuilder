# frozen_string_literal: true

json.styles do
  json.array!(@styles, partial: 'api/v1/items/styles/style', as: :style)
end
