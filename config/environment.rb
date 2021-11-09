# Load the Rails application.
require_relative 'application'

Rails.application.reloader.to_prepare do
  # Initialize the Rails application.
  Rails.application.initialize!
end
