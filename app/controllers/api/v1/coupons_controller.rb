# frozen_string_literal: true

module Api
  module V1
    class CouponsController < ApiController
      before_action :set_coupon, only: %i[show update destroy]

      def index
        @coupons = current_user.coupons.page(params[:page]).per(params[:per_page])
      end

      def create
        @coupon = current_user.coupons.new(coupon_params)
        @coupon.save!
      end

      def show; end

      def update
        @coupon.update!(coupon_params)
      end

      def destroy
        json_response({ message: 'Coupon was deleted' }, 200) if @coupon.destroy
      end

      private

      def set_coupon
        @coupon = current_user.coupons.find_by!(id: params[:id])
      end

      def coupon_params
        params.require(:coupon).permit(:code, :description, :valid_from, :valid_until, :redemption_limit, :coupon_redemptions_count, :amount, :amount_type)
      end
    end
  end
end
