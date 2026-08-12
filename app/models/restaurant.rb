class Restaurant < ApplicationRecord
  # when you have dependent destroy...
  # -> it will delete the reviews along with the restaurant
  # associations
  has_many :reviews, dependent: :destroy # restaurant.reviews
  # validations
  # validates :column_name, add the validation
  validates :name, presence: true
end
