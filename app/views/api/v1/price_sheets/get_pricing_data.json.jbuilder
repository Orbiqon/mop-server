json.sizes @sizes do |size|
  json.id size.id
  json.name size.name
  json.papers @papers do |paper|
    json.id paper.id
    json.name paper.name
  end
  json.price nil 
end