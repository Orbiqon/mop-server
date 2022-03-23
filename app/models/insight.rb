class Insight < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
end
