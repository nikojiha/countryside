class Post < ApplicationRecord

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :customer
  belongs_to :tag
  has_many_attached :images
  
  validates :location, presence: true
  validates :images, presence: true
  
  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
end
