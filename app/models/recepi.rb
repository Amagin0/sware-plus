class Recepi < ApplicationRecord
  attachment :recepi_image
  belongs_to :customer
end
