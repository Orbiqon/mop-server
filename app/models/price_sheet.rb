class PriceSheet < ApplicationRecord
  validates :name, presence: true
  
  has_many :price_sheet_entries
  accepts_nested_attributes_for :price_sheet_entries
  
  has_many :artworks
end
