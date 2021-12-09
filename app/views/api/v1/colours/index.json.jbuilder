# frozen_string_literal: true

json.set! :colours do
  json.array!(@colours, partial: 'api/v1/colours/colour', as: :colour)
end
