class FurnituresController < ApplicationController

skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    page = params[:page] || 1
    if (params[:category].present?)
      @furnitures = Furniture.where(furniture_type: params[:category]).page(page)
    else
      @furnitures = Furniture.page(page)
    end
  end

  def show
    @furniture = Furniture.find(params[:id])
    @rental = Rental.new
  end

  # def create
  #   @furniture = Furniture.find([:id])
  #   @furniture = Furniture.new(strong_params)
  #   @furniture.rentals = @furniture
  #   if @furniture.save
  #     redirect_to @furnitures
  #   else
  #     @furniture = Furniture.all
  #     render 'furnitures/show', status: :unprocessable_entity
  #   end
  # end

  def strong_params
    params.require(:furniture).permit(:name, :furniture_type, :price, :description)
  end
end
