# frozen_string_literal: true

module Api
  module V1
    # Artworks Controller
    class ArtworksController < ApiController
      before_action :set_artwork, only: %i[show update destroy]

      def index
        @artworks = current_user.artworks.sellable(params[:sellable]).exhibitionable(params[:exhibitionable]).page(params[:page]).per(params[:per_page])
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
        @artwork.delete
      end

      private

      def set_artwork
        @artwork = current_user.artworks.find_by!(id: params[:id])
      end

      def artwork_params
        params.require(:artwork).permit(:name, :notes, :edition_type, :edition_quantity, :sellable,
                                        :exhibitionable, :status,
                                        style_ids: [],
                                        colour_ids: [],
                                        artwork_images_attributes: %i[id image])
      end
    end
  end
end
