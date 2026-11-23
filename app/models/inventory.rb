class Inventory < ApplicationRecord
  belongs_to :creator, class_name: "User"
  belongs_to :category

  validates :title, presence: true, length: { maximum: 150 }
end
