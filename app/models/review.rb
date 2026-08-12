class Review < ApplicationRecord
  belongs_to :restaurant # creates a method: review.restaurant
  # validations
  validates :content, presence: true
  # before_save :capitalize_content

  # def capitalize_content
  #   self.content = content.capitalize
  # end
end
