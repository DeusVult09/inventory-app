class IdElement < ApplicationRecord
  belongs_to :inventory

  validate :max_elements, on: :create
  validates :position, presence: true, uniqueness: { scope: :inventory_id }
  enum :kind, {fixed: "fixed", datetime: "datetime", sequence: "sequence",
  guid: "guid", random_6digit: "random_6digit", random_9digit: "random_9digit", 
  random_20digit: "random_20digit", random_32digit: "random_32digit"}, validate: true

  private

  def max_elements
    return unless inventory
    if inventory.id_elements.size >= 10
      errors.add :base, :invalid, message: "Inventories cannot have more that 10 elements"
    end
  end
end
