module Api
  module V1
    class PackagesController < ApiController
      def index
        @packages = Package.enable.where(trial: false).page(params[:page]).per(params[:per_page])
      end

      def trial
        @package = Package.enable.where(trial: true).first
      end

      def show
        @package = Package.find(params[:id])
      end
    end
  end
end
