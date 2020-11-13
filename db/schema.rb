# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_13_162529) do

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "release_date"
    t.text "description"
    t.string "genre"
    t.decimal "price"
    t.string "cover_art"
    t.string "developer"
    t.integer "platform_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["platform_id"], name: "index_games_on_platform_id"
  end

  create_table "ordered_games", force: :cascade do |t|
    t.decimal "purchase_price"
    t.integer "quantity"
    t.integer "game_id", null: false
    t.integer "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_ordered_games_on_game_id"
    t.index ["order_id"], name: "index_ordered_games_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "total_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "games", "platforms"
  add_foreign_key "ordered_games", "games"
  add_foreign_key "ordered_games", "orders"
end
