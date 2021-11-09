json.set! :styles do
  json.array!(@styles, partial: 'api/v1/styles/style', as: :style)
end
