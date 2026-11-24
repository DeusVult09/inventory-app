class Item < ApplicationRecord
  belongs_to :inventory, counter_cache: true
  belongs_to :creator, class_name: "User", optional: true

  validates :custom_id, presence: true, uniqueness: { scope: :inventory_id }
end
