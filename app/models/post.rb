class Post < ApplicationRecord
  
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :custmer, dependent: :destroy
  belongs_to :tag, dependent: :destroy
end
