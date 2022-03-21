# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dir[Rails.root.join('db', 'seeds', '*.rb')].sort.each do |file|
  require file
end

Package.create(name: 'Free', description: 'A free Package to get your work seen and sell your work', enable: true, price: 0, duration_type: :daily, duration_span: 10, trial: true)

Package.create(name: 'Starter', description: 'A beginner Package to get your work seen and sell your work', enable: true, price: 8, duration_type: :monthly, duration_span: 1)
Package.create(name: 'Plus', description: 'A advance Package to get your work seen and sell your work', enable: true, price: 15, duration_type: :monthly, duration_span: 1)
Package.create(name: 'Pro', description: 'A premium Package to get your work seen and sell your work', enable: true, price: 25, duration_type: :monthly, duration_span: 1)

Package.create(name: 'Starter', description: 'A beginner Package to get your work seen and sell your work', enable: true, price: 80, duration_type: :yearly, duration_span: 1)
Package.create(name: 'Plus', description: 'A advance Package to get your work seen and sell your work', enable: true, price: 150, duration_type: :yearly, duration_span: 1)
Package.create(name: 'Pro', description: 'A premium Package to get your work seen and sell your work', enable: true, price: 250, duration_type: :yearly, duration_span: 1)
