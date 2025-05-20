class RentalsController < ApplicationController
  before_action :set_furniture, only: %i[new create]

  def index
    @rental = Rental.all
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.furniture = @furniture
    # dates = param[:furniture][:opening_date].split(' to ')
    # @furniture.start_date = dates.first
    # @furniture.end_date = dates.last
    if @rental.save
      redirect_to furniture_rentals_path(@furniture), notice: 'Saved Successfully'
    else
      render 'furniture/show', status: :unprocessable_entity
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:furniture_id, :user_id, :start_date, :end_date, :status)
  end

  def furniture_params
    params.require(:furniture).permit(:name, :type, :description, :user_id)
  end

  def set_furniture
    @furniture = Furniture.find[params(:furniture_id)]
  end
end


#  def create
#     # to create the instance from the form data
#     @restaurant = Restaurant.new(restaurant_params)
#     # dates = params[:restaurant][:opening_date].split(' to ')
#     # @restaurant.start_date = dates.first
#     # @restaurant.end_date = dates.last
#     if @restaurant.save
#       # when it saves -> go to the restaurants show page
#       redirect_to restaurant_path(@restaurant)
#     else
#       # when it doesnt save -> show the form again
#       render 'new', status: :unprocessable_entity # throws a 422 (for Turbo)
#     end
#   end
