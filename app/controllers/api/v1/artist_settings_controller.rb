module Api
  module V1
    class ArtistSettingsController < ApiController
      before_action :set_artist_settings, only: %i[update]
      
      def index
        @setting = current_user.artist_setting
      end
      
      # def show; end
      
      def update
       setting =  @artist_setting.update!(artist_setting_params)
       if setting
        @setting = current_user.artist_setting
       end
      end
      
      private
      
      def set_artist_settings
        @artist_setting = ArtistSetting.find_by(id: params['id'])
      end
      
      def artist_setting_params
        params.require(:artist_setting).permit(:payment_method, :store_currency_id, :self_fullfill_msg, :star_review, :feedback)
      end
    end
  end
end
