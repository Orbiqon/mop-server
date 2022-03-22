module Api
  module V1
    module Items
      class InsightsController < ItemsController
        def create
          @insight = Insight.new(insight_params)
          json_response({ message: 'Thnaks to subscribe' }, 200) if @insight.save!
        end

        private

        def insight_params
          params.require(:insight).permit(:name, :email)
        end
      end
    end
  end
end
