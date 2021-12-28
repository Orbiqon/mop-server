# frozen_string_literal: true

json.coupons do
  json.array! @coupons, partial: 'api/v1/coupons/coupon', as: :coupon
end

json.pagination do
  json.partial! 'api/v1/shared/pagination', collection: @coupons
end
