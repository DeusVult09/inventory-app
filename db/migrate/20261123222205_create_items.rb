class CreateItems < ActiveRecord::Migration[8.1]
  def change
    create_table :items do |t|
      t.references :inventory, null: false, foreign_key: true
      t.references :creator, null: false, foreign_key: true
      t.string :custom_id
      t.integer :lock_version
      t.integer :sequence

      t.timestamps
    end
  end
end
