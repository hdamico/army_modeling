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

ActiveRecord::Schema.define(version: 2019_10_31_020815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "armies", force: :cascade do |t|
    t.string "name"
    t.integer "coins", default: 1000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "civilization_id"
    t.index ["civilization_id"], name: "index_armies_on_civilization_id"
  end

  create_table "civilizations", force: :cascade do |t|
    t.string "name", null: false
    t.text "default_units", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "unit_type"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "army_id"
    t.index ["army_id"], name: "index_units_on_army_id"
  end

  add_foreign_key "armies", "civilizations"
  add_foreign_key "units", "armies"
end
