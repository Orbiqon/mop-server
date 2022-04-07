# frozen_string_literal: true

class ExhibitionStyle < ApplicationRecord
  include Activeable
  validates :name, uniqueness: true, presence: true
  before_create :set_form
  before_update :set_form

  def set_form
    self.slug = name.squeeze(' ').strip.downcase
  end

  has_one_attached :image
  has_one :exhibition
end
