# frozen_string_literal: true

module Api
  module V1
    class ExhibitionsController < ApiController
      before_action :set_exhibition, only: %i[show update destroy]
      def index
        @exhibitions = current_user.exhibitions.draft(params[:draft]).page(params[:page]).per(params[:per_page])
      end

      def create
        @exhibition = current_user.exhibitions.new(exhibition_params)
        @exhibition.save!
      end

      def show; end

      def update
        @exhibition.update!(exhibition_params)
      end

      def destroy
        @exhibition.delete
      end

      private

      def set_exhibition
        @exhibition = Exhibition.find_by!(id: params[:id])
      end

      def exhibition_params
        params.require(:exhibition).permit(:room_name, :artist_name, :status, :draft, :exhibition_style_id,
                                           artwork_ids: [],
                                           exhibition_style_ids: [])
      end
    end
  end
end
