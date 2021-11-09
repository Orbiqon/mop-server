module Api
  module V1
    class ColoursController < ApiController
      def index 
        @colours = Colour.where(status: 1).order('id ASC')
      end
    end
  end
end
