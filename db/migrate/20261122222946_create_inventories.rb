class CreateInventories < ActiveRecord::Migration[8.1]
  def change
    create_table :inventories do |t|
      t.string :title, null: false
      t.text :description
      t.references :creator, null: false, foreign_key: { to_table: :users }
      t.references :category, null: false, foreign_key: true
      t.boolean :is_public, default: false, null: false
      t.integer :lock_version, default: 0, null: false
      t.integer :items_count, default: 0, null: false

      %w[string text number link bool].each do |type|
        (1..3).each do |num|
          t.string "#{type}#{num}_name"
          t.string "#{type}#{num}_description"
          t.boolean "#{type}#{num}_in_table", null: false, default: false
        end
      end
      t.timestamps
    end
  end
end