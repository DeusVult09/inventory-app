# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_11_22_222946) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "inventories", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.bigint "creator_id", null: false
    t.bigint "category_id", null: false
    t.boolean "is_public", default: false, null: false
    t.integer "lock_version", default: 0, null: false
    t.integer "items_count", default: 0, null: false
    t.string "string1_name"
    t.string "string1_description"
    t.boolean "string1_in_table", default: false, null: false
    t.string "string2_name"
    t.string "string2_description"
    t.boolean "string2_in_table", default: false, null: false
    t.string "string3_name"
    t.string "string3_description"
    t.boolean "string3_in_table", default: false, null: false
    t.string "text1_name"
    t.string "text1_description"
    t.boolean "text1_in_table", default: false, null: false
    t.string "text2_name"
    t.string "text2_description"
    t.boolean "text2_in_table", default: false, null: false
    t.string "text3_name"
    t.string "text3_description"
    t.boolean "text3_in_table", default: false, null: false
    t.string "number1_name"
    t.string "number1_description"
    t.boolean "number1_in_table", default: false, null: false
    t.string "number2_name"
    t.string "number2_description"
    t.boolean "number2_in_table", default: false, null: false
    t.string "number3_name"
    t.string "number3_description"
    t.boolean "number3_in_table", default: false, null: false
    t.string "link1_name"
    t.string "link1_description"
    t.boolean "link1_in_table", default: false, null: false
    t.string "link2_name"
    t.string "link2_description"
    t.boolean "link2_in_table", default: false, null: false
    t.string "link3_name"
    t.string "link3_description"
    t.boolean "link3_in_table", default: false, null: false
    t.string "bool1_name"
    t.string "bool1_description"
    t.boolean "bool1_in_table", default: false, null: false
    t.string "bool2_name"
    t.string "bool2_description"
    t.boolean "bool2_in_table", default: false, null: false
    t.string "bool3_name"
    t.string "bool3_description"
    t.boolean "bool3_in_table", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_inventories_on_category_id"
    t.index ["creator_id"], name: "index_inventories_on_creator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.string "provider", null: false
    t.string "uid", null: false
    t.string "status", default: "active"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
  end

  add_foreign_key "inventories", "categories"
  add_foreign_key "inventories", "users", column: "creator_id"
end
