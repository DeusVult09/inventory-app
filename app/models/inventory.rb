class Inventory < ApplicationRecord
  belongs_to :creator
  belongs_to :category

  
end
