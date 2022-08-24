# frozen_string_literal: true

module Api
  module V1
    module Items
      class ColoursController < ItemsController
        def index
          @colours = Colour.active
        end
      end
    end
  end
end
