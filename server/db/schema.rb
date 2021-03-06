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

ActiveRecord::Schema[7.0].define(version: 2022_04_03_001644) do
  create_table "amounts", force: :cascade do |t|
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "recipe_id", null: false
    t.integer "ingredient_id", null: false
    t.index ["ingredient_id"], name: "index_amounts_on_ingredient_id"
    t.index ["recipe_id"], name: "index_amounts_on_recipe_id"
    t.index ["user_id"], name: "index_amounts_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.string "best_market"
    t.float "common_quantity"
    t.integer "common_price"
    t.index ["user_id"], name: "index_ingredients_on_user_id"
  end

  create_table "list_items", force: :cascade do |t|
    t.integer "ingredient_id", null: false
    t.integer "user_id", null: false
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_list_items_on_ingredient_id"
    t.index ["user_id"], name: "index_list_items_on_user_id"
  end

  create_table "procedures", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.integer "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_procedures_on_recipe_id"
    t.index ["user_id"], name: "index_procedures_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "amounts", "ingredients"
  add_foreign_key "amounts", "recipes"
  add_foreign_key "amounts", "users"
  add_foreign_key "ingredients", "users"
  add_foreign_key "list_items", "ingredients"
  add_foreign_key "list_items", "users"
  add_foreign_key "procedures", "recipes"
  add_foreign_key "procedures", "users"
  add_foreign_key "recipes", "users"
end
