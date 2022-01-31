class HowToMake < ApplicationRecord
  attachment :how_to_image
  belongs_to :recepi

  validates :recepi_make, length: { maximum: 75 }, presence: true
end
