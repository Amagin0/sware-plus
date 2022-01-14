class Genre < ApplicationRecord
  has_many :tags
  has_many :recepis, through: :tags

  validates :genre_name, presence: true
end
