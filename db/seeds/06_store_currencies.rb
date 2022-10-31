currencies = [
  {name: "Dollar"},
  {name: "Pound"},
  {name: "Euro"}
]

StoreCurrency.bulk_insert(values: currencies) if StoreCurrency.count.zero?
