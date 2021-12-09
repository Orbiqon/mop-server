# frozen_string_literal: true

module App
  class StylesController < ApplicationController
    before_action :set_style, only: %i[edit update]

    def index
      @q = Style.ransack(params[:q])
      @styles = @q.result(distinct: true)
    end

    def new
      @style = Style.new
    end

    def create
      @style = Style.new(style_params)
      if @style.save
        redirect_to styles_path, notice: 'Style successfully created'
      else
        render 'new', notice: 'Something went wrong'
      end
    end

    def edit; end

    def update
      if @style.update(style_params)
        redirect_to styles_path, notice: 'Style was successfully updated.'
      else
        render :edit
      end
    end

    private

    def set_style
      @style = Style.find(params[:id])
    end

    def style_params
      params.require(:style).permit(:name, :status)
    end
  end
end
