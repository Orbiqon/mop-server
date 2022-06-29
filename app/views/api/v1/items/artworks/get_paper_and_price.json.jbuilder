json.paper_and_price do
  json.papers [Paper.find_by(id: @size&.paper_one)&.name, Paper.find_by(id: @size&.paper_two)&.name]
  json.price @size&.price
end
