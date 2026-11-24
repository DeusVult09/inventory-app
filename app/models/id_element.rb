class IdElement < ApplicationRecord
  belongs_to :inventory

  validates :position, presence: true, uniqueness: { scope: :inventory_id }
  enum :kind, {fixed: "fixed", datetime: "datetime", sequence: "sequence",
  guid: "guid", random_6digit: "random_6digit", random_9digit: "random_9digit", 
  random_20digit: "random_20digit", random_32digit: "random_32digit"}, validate: true
end
