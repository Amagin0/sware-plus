class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recepis, dependent: :destroy
  has_many :recepi_comments, dependent: :destroy
  has_many :recepi_raties, dependent: :destroy

  validates :name, presence: true

end
