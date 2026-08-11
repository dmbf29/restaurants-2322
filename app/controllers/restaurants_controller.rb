class RestaurantsController < ApplicationController
  # /restaurants
  def index
    @restaurants = Restaurant.all
    # render 'index.html.erb'
  end

  # /restaurants/2
  def show
    # pull the ID from the URL -> params[:id]
    @restaurant = Restaurant.find(params[:id])
    # render 'show.html.erb'
  end

  # /restaurants/new
  def new
    # Just for the form
    @restaurant = Restaurant.new
    # render 'new.html.erb'
  end

  # WE CAN'T ACCESS BY A URL -> we have to submit a form
  # NO VIEW
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      # go to the show page
      redirect_to restaurant_path(@restaurant)
    else
      # show the form again but with the restaurant that didnt save
      render "new", status: :unprocessable_entity # 422
    end
  end

  # restaurants/1/edit
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  # YOU CANT ACCESS VIA A URL, you have to submit a form
  # No view
  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      # show the form again but with the restaurant that didnt save
      render "edit", status: :unprocessable_entity # 422
    end
  end

  # YOU CANT ACCESS VIA A URL, you have to click a delete button
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    # Strong params -> whitelist the attributes the user can give in the form
    params.require(:restaurant).permit(:name, :address, :rating, :category)
  end
end
