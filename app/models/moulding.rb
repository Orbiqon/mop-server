class Moulding < ApplicationRecord
  validates :name, presence: true, uniqueness: true  
end
