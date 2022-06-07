continents = [
  {name: "Asia"},
  {name: "Africa"},
  {name: "Europe"},
  {name: "North America"},
  {name: "South America"},
  {name: "Australia/Oceania"},
  {name: "Antarctica"}
]

Continent.bulk_insert(values: styles) if Continent.count.zero?
