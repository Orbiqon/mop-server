module Api
  module V1
    class PriceSheetsController < ApiController
      before_action :set_price_sheet, only: %i[update]
      def index
        @price_sheets = PriceSheet.all  
      end
      
      def create
        @price_sheet = PriceSheet.new(price_sheet_params)
        @price_sheet.save!
      end
      
      def show
        @price_sheet = PriceSheet.find_by(id: params[:id])  
      end
      
      def update
        @price_sheet.price_sheet_entries.delete_all
        @price_sheet.update!(price_sheet_params)
      end
      
      def get_pricing_data
        @sizes = Size.all
        @papers = Paper.all
      end
      
      private
      
      def price_sheet_params
        params.require(:price_sheet).permit(:name,
                                            price_sheet_entries_attributes: %i[ id paper_one paper_two size price])
      end
      
      def set_price_sheet
        @price_sheet = PriceSheet.find_by(id: params[:id])
      end
    end
  end
end
