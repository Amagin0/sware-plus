class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  is_impressionable counter_cache: true

  has_many :recepis, dependent: :destroy
  has_many :recepi_comments, dependent: :destroy
  has_many :recepi_raties, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # 自分がフォローされている(passive_relationships, followed_id, followers)
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # 自分がフォローしている(active_relationships, follower_id, followings)
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy

  # 自分がフォローしている人orフォローされている人の一覧を出す
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :followings, through: :active_relationships, source: :followed


  scope :latest, -> { order(updated_at: :desc)}
  scope :raties, -> { Recepi.left_joins(:recepi_raties) }
  scope :top_rate_taste, -> { raties.order(recepi_taste: :desc).distinct}
  scope :top_rate_fun, -> { raties.order(recepi_fun: :desc).distinct }

  # フォローした時の処理
  def follow(customer_id)
    active_relationships.create(followed_id: customer_id)
  end

  # フォローを外す時の処理
  def unfollow(customer_id)
    active_relationships.find_by(followed_id: customer_id).destroy
  end

  # フォローしているかの判定(しているならtrueが返る)
  def following?(customer)
    followings.include?(customer)
  end

  validates :name, presence: true

end
