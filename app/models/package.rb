# frozen_string_literal: true

class Package < ApplicationRecord
  enum duration_type: %i[daily monthly yearly]

  validates :duration_type, presence: true
  validates :duration_span, presence: true, numericality: { only_integer: true, other_than: 0 }

  def calculate_end_date
    case duration_type
    when 'daily'
      Time.now + duration_span.days
    when 'monthly'
      Time.now + duration_span.months
    when 'yearly'
      Time.now + duration_span.years
    end
  end
end
