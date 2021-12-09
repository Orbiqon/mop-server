# frozen_string_literal: true

colours = [
  { name: 'RED', status: 1 },
  { name: 'GREEN', status: 1 },
  { name: 'BLUE', status: 1 },
  { name: 'YELLOW', status: 1 },
  { name: 'BROWN', status: 1 },
  { name: 'WHITE', status: 1 },
  { name: 'BLACK', status: 1 },
  { name: 'PURPLE', status: 1 },
  { name: 'ORANGE', status: 1 },
  { name: 'GREY', status: 1 }
]

Colour.bulk_insert(values: colours) if Colour.count.zero?
