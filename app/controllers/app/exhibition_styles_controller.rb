# frozen_string_literal: true

module App
  class ExhibitionStylesController < ApplicationController
    before_action :set_exhibition_style, only: %i[edit update]

    def index
      @q = ExhibitionStyle.ransack(params[:q])
      @exhibition_styles = @q.result(distinct: true)
    end

    def new
      @exhibition_style = ExhibitionStyle.new
    end

    def create
      @exhibition_style = ExhibitionStyle.new(exhibition_style_params)
      if @exhibition_style.save
        redirect_to exhibition_styles_path, notice: 'Exhibition Style successfully created'
      else
        render 'new', notice: 'Something went wrong'
      end
    end

    def edit; end

    def update
      if @exhibition_style.update(exhibition_style_params)
        redirect_to exhibition_styles_path, notice: 'Exhibition Style was successfully updated.'
      else
        render :edit
      end
    end

    private

    def set_exhibition_style
      @exhibition_style = ExhibitionStyle.find(params[:id])
    end

    def exhibition_style_params
      params.require(:exhibition_style).permit(:name, :status, :slug, :description, :image)
    end
  end
end
