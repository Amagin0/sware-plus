class Recepi < ApplicationRecord
  attachment :recepi_image
  belongs_to :customer

  validates :recepi_title, length: { maximum: 32 }
  validates :raty_taste, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0.5
  }, presence: true
  # validates :raty_fun, numericality: {
  #   less_than_or_equal_to: 5,
  #   greater_than_or_equal_to: 0.5
  # }, presence: true
end
