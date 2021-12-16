# frozen_string_literal: true

module Api
  module V1
    class ExhibitionStylesController < ApiController
      def index
        @exhibition_styles = ExhibitionStyle.active
      end
    end
  end
end
