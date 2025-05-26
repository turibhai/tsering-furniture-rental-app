class FurnituresController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    page = params[:page] || 1

    if params[:q].present?
      @furnitures = Furniture.search(params[:q]).page(page)
    elsif params[:category].present?
      @furnitures = Furniture.where(furniture_type: params[:category]).page(page)
    else
      @furnitures = Furniture.page(page)
    end
  end

  def edit
    @furniture = Furniture.find(params[:id])
  end

  def update
    @furniture = Furniture.find_by(id: params[:id])
    if @furniture.update(furniture_params)
      @furniture.save
      redirect_to furniture_path(@furniture)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @furniture = Furniture.find(params[:id])
    return redirect_to furnitures_path, alert: "Furniture not found" unless @furniture
    @rental = Rental.new
    @owner = @furniture.user
  end

 def create
  @furniture = Furniture.new(furniture_params)
  @furniture.user = current_user

  if @furniture.save
    redirect_to owner_rentals_path, notice: "Furniture created!"
  else
    @rentals_as_owner = current_user.rentals_as_owner
    @furnitures = current_user.furnitures

    render 'owner/rentals/index', status: :unprocessable_entity
  end
end


  private

  def furniture_params
    params.require(:furniture).permit(:name, :furniture_type, :description, :price, :photo)
  end
end
