module App
  class TaxRatesController < ApplicationController
    def index
      @tax_rates = TaxRate.all
    end
    
    def new
      @tax_rate = TaxRate.new
    end
    
    def create
      @tax_rate = TaxRate.new(tax_rate_params)
      if @tax_rate.save
        redirect_to tax_rates_path, notice: 'New Tax Rate successfully created'
      else
        render 'new', notice: 'Something went wrong'
      end
    end
    
    def edit; end
    
    def update
      if @tax_rate.update(tax_rate_params)
        redirect_to tax_rates_path, notice: 'Tax Rate was successfully updated.'
      else
        render :edit
      end
    end
    
    private

    def set_tax_rate
      @tax_rate = tax_rate.find(params[:id])
    end

    def tax_rate_params
      params.require(:tax_rate).permit(:continent_id, :country, :rate, :total_rate, :on_shipping, :on_digital)
    end
  end
end
