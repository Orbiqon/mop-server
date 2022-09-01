# frozen_string_literal: true

module App
  class ColoursController < ApplicationController
    before_action :set_colour, only: %i[edit update]

    def index
      @q = Colour.ransack(params[:q])
      @colours = @q.result(distinct: true).page(params[:page]).per(10)
    end

    def new
      @colour = Colour.new
    end

    def create
      @colour = Colour.new(colour_params)
      if @colour.save
        redirect_to colours_path, notice: 'Colour successfully created'
      else
        render 'new', notice: 'Something went wrong'
      end
    end

    def edit; end

    def update
      if @colour.update(colour_params)
        redirect_to colours_path, notice: 'Colour was successfully updated.'
      else
        render :edit
      end
    end

    private

    def set_colour
      @colour = Colour.find(params[:id])
    end

    def colour_params
      params.require(:colour).permit(:name, :status)
    end
  end
end
