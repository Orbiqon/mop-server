json.monthly_packages do
  json.array! @packages.where(duration_type: "monthly"), partial: 'api/v1/items/packages/monthly', as: :package
end
json.yearly_packages do
  json.array! @packages.where(duration_type: "yearly"), partial: 'api/v1/items/packages/monthly', as: :package
end
