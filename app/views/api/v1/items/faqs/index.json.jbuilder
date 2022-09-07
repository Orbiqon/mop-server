# frozen_string_literal: true

json.faqs do
  json.array!(@faqs, partial: 'api/v1/items/faqs/faq', as: :faq)
end
