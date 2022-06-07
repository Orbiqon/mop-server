class Continent < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :tax_rates
end
