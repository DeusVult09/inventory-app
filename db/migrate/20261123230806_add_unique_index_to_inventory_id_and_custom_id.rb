class AddUniqueIndexToInventoryIdAndCustomId < ActiveRecord::Migration[8.1]
  def change
    add_index :items, [:inventory_id, :custom_id], unique: true
  end
end
