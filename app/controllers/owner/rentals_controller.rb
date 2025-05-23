class Owner::RentalsController < ApplicationController
  def index
    @rentals_as_owner = current_user.rentals_as_owner
    # @rentals = current_user.furnitures.map(&:rentals).flatten
    @rental = Rental.new
    @furniture = Furniture.new
    @furnitures = current_user.furnitures
  end

  def update
    @owner = Owner.find(current_user.id)
  end
end
