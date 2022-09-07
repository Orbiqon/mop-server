module Api
  module V1
    module Items
      class FaqsController < ItemsController
        def index 
          @faqs = Faq.status
        end
      end
    end
  end
end
