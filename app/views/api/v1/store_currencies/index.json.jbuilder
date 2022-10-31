# frozen_string_literal: true

json.set! :store_currencies do
  json.array!(@store_currencies, partial: 'api/v1/store_currencies/store_currency', as: :currency)
end
