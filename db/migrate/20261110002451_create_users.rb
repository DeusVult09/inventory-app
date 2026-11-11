class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :status, default: "active"
      t.boolean :admin, default: "false"

      t.timestamps
    end
  end
end
