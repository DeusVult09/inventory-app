class AddUniqueIndexToInventoryIdAndPosition < ActiveRecord::Migration[8.1]
  def change
    add_index :id_elements, [:inventory_id, :position], unique: true
  end
end
