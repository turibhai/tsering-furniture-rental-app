class ReviewsController < ApplicationController
  def show
    @furniture = Furniture.find(params[:furniture_id])
    @review = @furniture.reviews.new
  end

  def create
    @furniture = Furniture.find(params[:furniture_id])
    @review = @furniture.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @furniture, notice: "Saved Review"
    else
      redirect_to furniture_reviews_path, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating, :furniture_id)
  end
end
