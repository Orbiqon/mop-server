module Api
  module V1
    class PriceSheetsController < ApiController
      
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
      
      def get_pricing_data
        @sizes = Size.all
        @papers = Paper.all
      end
      
      private
      
      def price_sheet_params
        params.require(:price_sheet).permit(:name,
                                            price_sheet_entries_attributes: %i[id paper_one paper_two size price])
      end
    end
  end
end
