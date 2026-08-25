class ReviewsController < ApplicationController
  # Nested resource route:
  # /restaurants/25/reviews/new
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
    authorize @review
  end

  # Triggered only by a form
  # POST /restaurants/25/reviews
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    authorize @review
    if @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    authorize @review
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
