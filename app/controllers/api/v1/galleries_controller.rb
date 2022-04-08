# frozen_string_literal: true

module Api
  module V1
    class GalleriesController < ApiController
      before_action :set_gallery, only: %i[show update]

      def show; end

      def update
        @gallery.update!(gallery_params)
      end

      private

      def set_gallery
        @gallery = current_user.gallery
      end

      def gallery_params
        params.require(:gallery).permit(:name, :artist_name, :gallery_type, :domain, :welcome_video, :logo, :watermark)
      end
    end
  end
end
