class Owner::RentalsController < ApplicationController
  def index
    @rentals = Rental.where(user: current_user)
  end
end
