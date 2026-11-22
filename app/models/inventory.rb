class Inventory < ApplicationRecord
  belongs_to :creator
  belongs_to :category

  validates :name, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: { maximum: 50 }
end
