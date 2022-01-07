class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recepis, dependent: :destroy

  validates :name, presence: true

  # def recepis
  #   return Recepi.where(customer_id: self.id)
  # end
end
