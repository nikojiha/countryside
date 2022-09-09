class Favorite < ApplicationRecord
  
   belongs_to :customer, dependent: :destroy
   belongs_to :post, dependent: :destroy
   
end
