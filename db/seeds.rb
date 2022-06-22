# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Dir[Rails.root.join('db', 'seeds', '*.rb')].sort.each do |file|
#   require file
# end

papers = [
  {name: "Pearl"},
  {name: "Matte"}
]

Paper.bulk_insert(values: papers) if Paper.count.zero?

sizes = [
  {name: "10x8"},
  {name: "16x12"},
  {name: "20x16"},
  {name: "24x20"},
  {name: "30x30"},
  {name: "40x30"}
]

Size.bulk_insert(values: sizes) if Size.count.zero?

frames = [
  {name: "Black"}, 
  {name: "White"},
  {name: "Natural Wood"}
]

Frame.bulk_insert(values: frames) if Frame.count.zero?

mouldings = [
  {name: '1½" Gallery'},
  {name: '¾" Gallery Fine'},
  {name: '1½" Gallery Grand'}
]

Moulding.bulk_insert(values: mouldings) if Moulding.count.zero?

borders = [
  {name: "1"},
  {name: "2"},
  {name: "3"}
]

Border.bulk_insert(values: borders) if Border.count.zero?