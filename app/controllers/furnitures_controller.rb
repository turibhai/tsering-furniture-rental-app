class FurnituresController < ApplicationController
  
skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    page = params[:page] || 1
    @furnitures = Furniture.page(page)
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
