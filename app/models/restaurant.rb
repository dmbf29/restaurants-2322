class Restaurant < ApplicationRecord
  # associations
  # validations
  # validates :column_name, add the validation
  validates :name, presence: true
end
