# frozen_string_literal: true

module Api
  module V1
    module Items
      class GalleriesController < ItemsController
        before_action :set_gallery, only: %i[show]

        def index
          @q = Gallery.ransack(params[:q])
          @galleries = @q.result.gallery_type('public_gallery').page(params[:page]).per(params[:per_page])
        end

        def show; end

        private

        def set_gallery
          @gallery = Gallery.find_by!(id: params[:id])
        end
      end
    end
  end
end
