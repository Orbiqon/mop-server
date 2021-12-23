module Api
  module V1
    class ProfilesController < ApiController
      before_action :set_profile, only: %i[index update]

      def index; end

      def update
        @profile.update!(profile_params)
      end

      private

      def set_profile
        @profile = current_user.profile
      end

      def profile_params
        params.require(:profile).permit(:first_name, :surname, :company_name,
                                        :phone_number, :bio, :picture,
                                        social_account: {}, style_ids: [])
      end
    end
  end
end
