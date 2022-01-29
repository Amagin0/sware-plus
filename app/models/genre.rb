class Genre < ApplicationRecord
  has_many :tags
  has_many :recepis, through: :tags
  validates :genre_name, presence: true

  def self.search(search)
    if search != '#'
      genre = Genre.where('genre_name LIKE?', "%#{search}%")
      genre[0].recepis
    else
      Recepi.all
    end
  end
end
