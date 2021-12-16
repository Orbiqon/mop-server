# frozen_string_literal: true

exhibition_styles = [
  { name: 'STYLE 1', status: 1 },
  { name: 'STYLE 2', status: 1 },
  { name: 'STYLE 3', status: 1 },
  { name: 'STYLE 4', status: 1 },
  { name: 'STYLE 5', status: 1 }
]

ExhibitionStyle.bulk_insert(values: exhibition_styles) if ExhibitionStyle.count.zero?
