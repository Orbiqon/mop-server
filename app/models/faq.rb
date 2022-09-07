class Faq < ApplicationRecord
  scope :status, -> { where(status: true) }
end
