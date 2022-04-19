module Api
  module V1
    module Items
      class PackagesController < ItemsController
        def index
          @packages = Package.enable.where(trial: false).page(params[:page]).per(params[:per_page])
        end
        
        def trial
          @package = Package.enable.where(trial: true).first
        end
      end
    end
  end
end
