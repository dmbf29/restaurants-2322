class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  # /restaurants/top
  def top
    @restaurants = Restaurant.where(rating: 5)
  end

  # /restaurants/25/navigate
  def navigate
    # get the ID from the URL
    @restaurant = Restaurant.find(params[:id])
  end

  # /restaurants
  def index
    # @restaurants = Restaurasnt.all
    # @restaurants = current_user.restaurants
    @restaurants = policy_scope(Restaurant) # Restaurant IS "scope" -> scope.all
    # render 'index.html.erb'
  end

  # /restaurants/2
  def show
    # pull the ID from the URL -> params[:id]
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
    # render 'show.html.erb'
  end

  # /restaurants/new
  def new
    # Just for the form
    @restaurant = Restaurant.new
    authorize @restaurant
    # render 'new.html.erb'
  end

  # WE CAN'T ACCESS BY A URL -> we have to submit a form
  # NO VIEW
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    authorize @restaurant
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
    authorize @restaurant
  end

  # YOU CANT ACCESS VIA A URL, you have to submit a form
  # No view
  def update
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
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
    authorize @restaurant
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    # Strong params -> whitelist the attributes the user can give in the form
    params.require(:restaurant).permit(:name, :address, :rating, :category)
  end
end
