module Api
  module V1
    class StoreCurrenciesController < ApiController
      def index
        @store_currencies = StoreCurrency.all
      end
    end
  end
end
