# frozen_string_literal: true

module Api
  module V1
    module Items
      class ArtworksController < ItemsController
        before_action :set_artwork, only: %i[show]

        def index
          @q = Artwork.ransack(params[:q])
          @artworks = @q.result.sellable('true').exhibitionable('true').page(params[:page]).per(params[:per_page])
        end

        def show; end

        private

        def set_artwork
          @artwork = Artwork.find_by!(id: params[:id])
        end
      end
    end
  end
end
