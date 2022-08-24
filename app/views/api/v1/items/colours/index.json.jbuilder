# frozen_string_literal: true

json.colours do
  json.array!(@colours, partial: 'api/v1/items/colours/colour', as: :colour)
end
