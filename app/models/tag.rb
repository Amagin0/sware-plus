class Tag < ApplicationRecord
  belongs_to :genre
  belongs_to :recepi
  # validates :recepi_id, uniqueness: { scope: :genre_id }
end
