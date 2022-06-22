class Border < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
