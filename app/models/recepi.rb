class Recepi < ApplicationRecord
  attachment :recepi_image
  belongs_to :customer

  validates :recepi_title, length: { maximum: 32 }
  validates :recepi_describe, length: { maximum: 32 }
end
