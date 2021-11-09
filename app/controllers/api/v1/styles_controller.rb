module Api
  module V1
    class StylesController < ApiController
      def index
        @styles = Style.where(status: 1).order('id ASC')
      end
    end
  end
end
