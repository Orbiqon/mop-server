# frozen_string_literal: true

module Api
  module V1
    module Items
      class ItemsController < ApiController
        skip_before_action :doorkeeper_authorize!
      end
    end
  end
end
