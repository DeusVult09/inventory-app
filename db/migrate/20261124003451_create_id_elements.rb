class CreateIdElements < ActiveRecord::Migration[8.1]
  def change
    create_table :id_elements do |t|
      t.references :inventory, null: false, foreign_key: true
      t.integer :position, null: false
      t.string :kind, null: false
      t.string :format
      t.string :fixed_text

      t.timestamps
    end
  end
end
