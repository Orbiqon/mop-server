module App
  class FaqsController < ApplicationController
    before_action :set_params, only: %i[edit update]
    
    def index
      @q = Faq.ransack(params[:q])
      @faqs = @q.result(distinct: true).page(params[:page]).per(10)
    end
    
    def new
      @faq = Faq.new
    end

    def create
      @faq = Faq.new(faq_params)
      if @faq.save
        redirect_to faqs_path, notice: 'Faq successfully created'
      else
        render 'new', notice: 'Something went wrong'
      end
    end

    def edit; end

    def update
      if @faq.update(faq_params)
        redirect_to faqs_path, notice: 'Faq was successfully updated.'
      else
        render :edit
      end
    end
    
    private

    def set_faq
      @faq = Faq.find(params[:id])
    end

    def faq_params
      params.require(:faq).permit(:question, :answer, :status)
    end
  end
end
