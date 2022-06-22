class Mount < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
