# frozen_string_literal: true

require 'api_error_handler'

module Api
  module V1
    class ApiController < ActionController::API
      before_action :doorkeeper_authorize!
      respond_to :json
      helper ApplicationHelper

      include Response
      include CustomException
      handle_api_errors(backtrace: true)

      def current_user
        User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      end
    end
  end
end
