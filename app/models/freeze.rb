class Freeze < ApplicationRecord
  
  belongs_to :customer, optional: true

end
