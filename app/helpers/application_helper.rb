# frozen_string_literal: true

module ApplicationHelper
  def boolean_to_text(status)
    status ? 'Active' : 'Inactive'
  end

  def url(data)
    return nil if data.nil?
    return nil unless data.attached?

    Rails.env == 'development' ? polymorphic_url(data) : data.service_url
  end
end
