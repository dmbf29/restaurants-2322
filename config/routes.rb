Rails.application.routes.draw do
  # verbs -> get, post, patch, delete
  # prefix -> nickname for the path ONLY (not the verb)

  # To build a path
  # http_verb '/path', to: 'controller#action', as: :prefix

  # Read all restaurants -> index
  get "/restaurants", to: "restaurants#index", as: :restaurants # (get)

  # Create a restaurant
  # One action JUST for the form
  get "/restaurants/new", to: "restaurants#new", as: :new_restaurant
  # One action to create the instance from the form information
  post "/restaurants", to: "restaurants#create" # , as: :restaurants # (post)

  # Edit a restaurant
  # One action JUST for the form
  get "/restaurants/:id/edit", to: "restaurants#edit", as: :edit_restaurant
  # One action to update the instance from the form information
  patch "/restaurants/:id", to: "restaurants#update", as: :restaurant

  # Read one restaurant -> show
  get "/restaurants/:id", to: "restaurants#show" # , as: :restaurant # (get)

  # Delete a restaurant
  delete "/restaurants/:id", to: "restaurants#destroy" # , as: :restaurant # (delete)
end

# <%= link_to "thing you see", prefix_path %>
# <%= link_to "All restaurants", restaurants_path %>

# prefix -> link
# prefix -> form
# prefix -> controller redirect_to
