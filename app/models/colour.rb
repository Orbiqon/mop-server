class Colour < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  before_create :set_form
  before_update :set_form

  def set_form
    self.name = name.squeeze(' ').strip.upcase
  end
end
