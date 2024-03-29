# frozen_string_literal: true

module Api
  module V1
    # Artworks Controller
    class ArtworksController < ApiController
      before_action :set_artwork, only: %i[show update destroy]

      def index
        @q = current_user.artworks.ransack(params[:q])
        @artworks = @q.result.sellable(params[:sellable]).exhibitionable(params[:exhibitionable]).page(params[:page]).per(params[:per_page])
      end

      def create
        @artwork = current_user.artworks.new(artwork_params)
        @artwork.save!
      end
            
      def show; end

      def update
        @artwork.update!(artwork_params)
      end

      def destroy
        json_response({ message: 'Artwork was deleted' }, 200) if @artwork.destroy
      end

      private

      def set_artwork
        @artwork = current_user.artworks.find_by!(id: params[:id])
      end

      def artwork_params
        params.require(:artwork).permit(:name, :notes, :edition_type, :edition_quantity, :sellable,
                                        :sell_via, :exhibitionable, :status, :price_sheet_id,
                                        style_ids: [],
                                        colour_ids: [],
                                        artwork_images_attributes: %i[id image orientation featured_image])
      end
    end
  end
end
