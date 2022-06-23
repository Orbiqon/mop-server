# frozen_string_literal: true

module Api
  module V1
    module Items
      class ArtworksController < ItemsController
        before_action :set_artwork, only: %i[show get_paper_and_price]

        def index
          @q = Artwork.ransack(params[:q])
          @artworks = @q.result.sellable('true').exhibitionable('true').page(params[:page]).per(params[:per_page])
        end
        
        def featured
          @artworks = Artwork.all.sample(4)  
        end
        
        def show; end
        
        def get_paper_and_price
          size = @artwork.price_sheet.price_sheet_entries.find_by(size: params[:size])  
          @papers = {"paper_one": size&.paper_one, "paper_two": size&.paper_two, "price": size&.price}
          json_response({ price_and_paper: @papers }, 200) 
        end
        
        private

        def set_artwork
          @artwork = Artwork.find_by!(id: params[:id])
        end
      end
    end
  end
end
