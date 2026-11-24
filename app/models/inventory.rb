class Inventory < ApplicationRecord
  belongs_to :creator, class_name: "User"
  belongs_to :category
  has_many :items, dependent: :destroy
  has_many :id_elements, -> { order(:position) }, dependent: :destroy

  validates :title, presence: true, length: { maximum: 150 }
end
