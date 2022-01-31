class RecepiIngredient < ApplicationRecord
  belongs_to :recepi

  validates :ingredient, length: { maximum: 20 }, presence: true
end
