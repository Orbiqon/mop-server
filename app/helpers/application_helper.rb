module ApplicationHelper
  def boolean_to_text(status)
    status ? 'Active' : 'Inactive'
  end
end
