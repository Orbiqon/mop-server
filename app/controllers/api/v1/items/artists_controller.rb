# frozen_string_literal: true

module Api
  module V1
    module Items
      class ArtistsController < ItemsController
        before_action :set_artist, only: %i[show]

        def index
          @q = User.with_role(:artist).ransack(params[:q])
          @artists = @q.result.page(params[:page]).per(params[:per_page])
        end

        def show; end
        
        def search_artist
          @q = User.with_role(:artist).ransack(params[:q])
          @artists = @q.result  
        end
        
        private

        def set_artist
          @artist = User.find_by!(id: params[:id])
        end
      end
    end
  end
end
