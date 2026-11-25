class Inventory < ApplicationRecord
  belongs_to :creator, class_name: "User"
  belongs_to :category
  has_many :items, dependent: :destroy
  has_many :id_elements, -> { order(:position) }, dependent: :destroy

  scope :latest, -> { order(created_at: :desc)  }
  scope :top_5_items, -> { order(items_count: :desc).limit(5) }

  validates :title, presence: true, length: { maximum: 150 }
end
