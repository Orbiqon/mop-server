# frozen_string_literal: true

module Api
  module V1
    class StylesController < ApiController
      def index
        @styles = Style.active
      end
    end
  end
end
