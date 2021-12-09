# frozen_string_literal: true

module Api
  module V1
    class ColoursController < ApiController
      def index
        @colours = Colour.active
      end
    end
  end
end
