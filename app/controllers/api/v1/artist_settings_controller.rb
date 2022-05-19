module Api
  module V1
    class ArtistSettingsController < ApiController
      before_action :set_artist_settings, only: %i[show update]
      
      def show; end
      
      def update
        @artist_setting.update!(artist_setting_params)
      end
      
      private
      
      def set_artist_settings
        @artist_setting = current_user.artist_setting  
      end
      
      def artist_setting_params
        params.require(:artist_setting).permit(:payment_method, :store_currency, :order_delay, :terms_of_service, :digital_image_licence)
      end
    end
  end
end
