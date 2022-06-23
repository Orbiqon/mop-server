json.paper_and_price do
  json.papers [Paper.find_by(id: @size&.paper_one).name, Paper.find_by(id: @size&.paper_two).name]
  json.price @size.price
end

# @papers = {"paper_one": size&.paper_one, "paper_two": size&.paper_two, "price": size&.price}
#           json_response({ price_and_paper: @papers }, 200)