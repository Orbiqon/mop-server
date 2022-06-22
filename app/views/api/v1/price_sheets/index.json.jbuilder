json.price_sheets do
  json.array! @price_sheets, partial: 'api/v1/price_sheets/price_sheet', as: :sheet
end