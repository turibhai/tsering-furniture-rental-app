class Owner::RentalsController < ApplicationController
  def index
    @rentals_as_owner = current_user.rentals_as_owner
    # @rentals = current_user.furnitures.map(&:rentals).flatten
    # @rental = Rental.find
  end

  def update
    @owner = Owner.find(current_user.id)
  end
end
