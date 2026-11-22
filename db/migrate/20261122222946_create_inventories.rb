class CreateInventories < ActiveRecord::Migration[8.1]
  def change
    create_table :inventories do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.references :creator, null: false, foreign_key: { to_table: :users }
      t.references :category, null: false, foreign_key: { to_table: :categories }
      t.boolean :is_public, default: "false"
      t.integer :lock_version, default: 0
      t.integer :items_count, default: 0

      t.timestamps


    end
  end
end
