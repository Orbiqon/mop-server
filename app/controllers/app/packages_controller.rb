module App
  class PackagesController < ApplicationController
    before_action :set_package, only: %i[edit update]
    
    def index
      @packages = Package.all
    end
    
    def edit; end
    
    def update
      if @package.update(package_params)
        redirect_to packages_path, notice: 'Packages was successfully updated.'
      else
        render :edit
      end
    end
    private
    
    def package_params
      params.require(:package).permit(:name, :description, :enable, :price, :duration_type, :duration_span, :trail)
    end
    
    def set_package
      @package = Package.find_by(id: params['id'])
    end
  end
end
