# frozen_string_literal: true

module Activeable
  extend ActiveSupport::Concern

  included do
    scope :active, -> { where(status: true) }
  end
end
