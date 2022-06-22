json.id @price_sheet.id
json.name @price_sheet.name
json.entries @price_sheet.price_sheet_entries do |entry|
  json.id entry.id
  json.paper_one Paper.find_by(id: entry.paper_one).name 
  json.paper_two Paper.find_by(id: entry.paper_two).name
  json.size Size.find_by(id: entry.size).name
  json.price entry.price
end
