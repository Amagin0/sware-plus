class RecepiRaty < ApplicationRecord
  belongs_to :customer
  belongs_to :recepi

  validates :recepi_taste, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0.5
  }, presence: true

  validates :recepi_fun, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0.5
  }, presence: true
end
