class Recepi < ApplicationRecord
  attachment :recepi_image
  belongs_to :customer
  has_many :recepi_comments, dependent: :destroy
  has_many :recepi_ingredients, dependent: :destroy
  has_many :how_to_makes, dependent: :destroy
  has_many :recepi_raties, dependent: :destroy
  accepts_nested_attributes_for :recepi_ingredients, :how_to_makes, allow_destroy: true

  validates :recepi_title, length: { maximum: 32 }

  def avg_taste
    unless self.recepi_raties.empty?
      recepi_raties.average(:recepi_taste).round(1)
    else
      0
    end
  end

  def avg_fun
    unless self.recepi_raties.empty?
      recepi_raties.average(:recepi_fun).round(1)
    else
      0
    end
  end


end
