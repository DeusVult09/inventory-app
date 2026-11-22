class CreateInventories < ActiveRecord::Migration[8.1]
  def change
    create_table :inventories do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.references :creator, null: false, foreign_key: { to_table: :users }
      t.references :category, null: false, foreign_key: { to_table: :categories }
      t.boolean :is_public, null: false
      t.integer :lock_version, null: false
      t.integer :items_count, null: false

      t.timestamps


    end
  end
end
