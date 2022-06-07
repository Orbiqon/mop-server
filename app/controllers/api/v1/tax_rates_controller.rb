module Api
  module V1
    class TaxRatesController < ApiController
      def index
        @tax_rates = TaxRate.all                        
      end
    end
  end
end
