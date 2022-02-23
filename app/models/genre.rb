class Genre < ApplicationRecord
  has_many :tags
  has_many :recepis, through: :tags
  validates :genre_name, presence: true

  def self.search(search)
    if !search.nil?
      genre = Genre.where('genre_name LIKE?', "%#{search}%")
      if search != '#' && genre.count != 0
        genre[0].recepis
      elsif search == '#'
        Recepi.all
      else
        genre = Genre.where('genre_name LIKE?', "%#{search}%")
      end
    else
      Recepi.all
    end
  end
end
