class RentalsController < ApplicationController

  def index
    @rentals = Rental.all
    @rentals = Rental.includes(:user, :furniture)
  end

  def create
    @furniture = Furniture.find(params[:furniture_id])
    @rental = Rental.new(rental_params)
    @rental.furniture = @furniture
    @rental.user = current_user
    dates = params[:rental][:start_date].split(' to ')
    @rental.start_date = dates.first
    @rental.end_date = dates.last
    @rental.status = 0
    if @rental.save
      redirect_to rentals_path, notice: 'Saved Successfully'
    else
      render 'furnitures/show', status: :unprocessable_entity
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:furniture_id, :user_id, :start_date, :end_date, :status)
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
