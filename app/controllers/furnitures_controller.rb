class FurnituresController < ApplicationController
  def index
  end

  def show
    @furniture = Furniture.find(params[:id])
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
