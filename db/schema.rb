# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_08_005548) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.boolean "spicy"
    t.string "taste"
    t.integer "restaurant_id"
  end

  create_table "networks", force: :cascade do |t|
    t.string "name"
    t.datetime "established"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.datetime "date_opened"
    t.string "style"
  end

  create_table "shows", force: :cascade do |t|
    t.string "name"
    t.boolean "daytime_show"
    t.bigint "network_id"
    t.integer "num_of_seasons"
    t.index ["network_id"], name: "index_shows_on_network_id"
  end

  add_foreign_key "shows", "networks"
end
