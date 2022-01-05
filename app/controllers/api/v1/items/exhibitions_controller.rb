# frozen_string_literal: true

module Api
  module V1
    module Items
      class ExhibitionsController < ItemsController
        def index
          @q = Exhibition.ransack(params[:q])
          @exhibitions = @q.result.draft('false').status.page(params[:page]).per(params[:per_page])
        end
      end
    end
  end
end
