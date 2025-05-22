class Owner::RentalsController < ApplicationController
  def index
    # @rentals = Rental.where(user: current_user)
    @rentals = current_user.furnitures.map(&:rentals).flatten
  end

  def update
    @owner = Owner.find(current_user.id)
  end
end
