class AddUniqueIndexToInventoryIdAndPosition < ActiveRecord::Migration[8.1]
  def change
    add_index :idelements [:inventory_id, :position], unique: true
  end
end
