class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :customer_freeze,  class_name: "Freeze", foreign_key: "customer_id", dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy #**foreign_key:**で参照先外部キーのカラムを指定
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_customer, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_customer, through: :followed, source: :follower # 自分をフォローしている人
  has_one_attached :profile_image #プロフ画像

  #メソッドに対して引数を設定し、引数に設定した値に画像のサイズを変換するようにした
  def get_profile_image(width, height)
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

   # ユーザーをフォローする
  def follow(customer_id)
    follower.create(followed_id: customer_id)
  end

  # ユーザーのフォローを外す
  def unfollow(customer_id)
    follower.find_by(followed_id: customer_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(customer)
    following_customer.include?(customer)
  end
end
