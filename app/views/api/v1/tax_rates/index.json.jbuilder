# frozen_string_literal: true

json.set! :tax_rates do
  json.array!(@tax_rates, partial: 'api/v1/tax_rates/tax_rate', as: :tax_rate)
end
