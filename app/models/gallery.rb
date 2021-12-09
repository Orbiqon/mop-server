# frozen_string_literal: true

class Gallery < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :size
  belongs_to :frame

  has_many :rooms

  aasm column: 'state' do
  end
end
