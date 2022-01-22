class Recepi < ApplicationRecord
  attachment :recepi_image
  is_impressionable
  belongs_to :customer
  has_many :tags, dependent: :destroy
  has_many :genres, through: :tags
  has_many :recepi_comments, dependent: :destroy
  has_many :recepi_ingredients, dependent: :destroy
  has_many :how_to_makes, dependent: :destroy
  has_many :recepi_raties, dependent: :destroy
  has_many :favorites, dependent: :destroy
  accepts_nested_attributes_for :recepi_ingredients, :how_to_makes, :tags, allow_destroy: true

  validates :recepi_title, length: { maximum: 32 }
  scope :latest, -> { order(updated_at: :desc) }
  scope :raties, -> { Recepi.left_joins(:recepi_raties) }
  scope :top_rate_taste, -> { raties.order(recepi_taste: :desc).distinct }
  scope :top_rate_fun, -> { raties.order(recepi_fun: :desc).distinct }

  def avg_taste
    if recepi_raties.empty?
      0
    else
      recepi_raties.average(:recepi_taste).round(1)
    end
  end

  def avg_fun
    if recepi_raties.empty?
      0
    else
      recepi_raties.average(:recepi_fun).round(1)
    end
  end

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  def self.search(search)
    if !search.nil?
      Recepi.where('recepi_title LIKE?', "%#{search}%")
      genre = Genre.where('genre_name LIKE?', "%#{search}%")
      if genre.count != 0
        genre[0].recepis
      else
        Recepi.where('recepi_title LIKE?', "%#{search}%")
      end
    else
      Recepi.all
    end
  end
end
