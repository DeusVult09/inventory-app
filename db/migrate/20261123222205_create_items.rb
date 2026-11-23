class CreateItems < ActiveRecord::Migration[8.1]
  def change
    create_table :items do |t|
      t.references :inventory, null: false, foreign_key: true
      t.references :creator, null: true, foreign_key: { to_table: :users }
      t.string :custom_id, null: false 
      t.integer :lock_version, default: 0, null: false
      t.integer :sequence,  default: 0, null: false

      (1..3).each do |num|
        t.string  "string#{num}"
        t.text    "text#{num}"
        t.decimal "number#{num}", precision: 12, scale: 2
        t.string  "link#{num}"
        t.boolean "bool#{num}", null: false, default: false
      end
      t.timestamps
    end
  end
end
