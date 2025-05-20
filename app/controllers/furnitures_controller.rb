class FurnituresController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @furnitures = Furniture.all
  end

  def show
  end
end
