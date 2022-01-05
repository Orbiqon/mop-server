# frozen_string_literal: true

class Gallery < ApplicationRecord
  enum gallery_type: {
    private_gallery: 0,
    public_gallery: 1
  }

  has_one_attached :logo
  has_one_attached :watermark

  belongs_to :user
  has_many :exhibitions

  scope :type, -> { where(gallery_type: 1) }
end
