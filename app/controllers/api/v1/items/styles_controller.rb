module Api
  module V1
    module Items
      class StylesController < ItemsController
        def index
          @styles = Style.active
        end
      end
    end
  end
end
