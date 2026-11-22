class Inventory < ApplicationRecord
  belongs_to :creator, class_name: "User"
  belongs_to :category, class_name: "Category"

  validates :name, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: { maximum: 50 }
end
