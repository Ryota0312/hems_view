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

ActiveRecord::Schema.define(version: 20170704142418) do

  create_table "battery_charges", force: :cascade do |t|
    t.float "value"
    t.datetime "timestamp"
    t.integer "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_battery_charges_on_house_id"
  end

  create_table "battery_discharges", force: :cascade do |t|
    t.float "value"
    t.datetime "timestamp"
    t.integer "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_battery_discharges_on_house_id"
  end

  create_table "fuel_cells", force: :cascade do |t|
    t.float "value"
    t.datetime "timestamp"
    t.integer "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_fuel_cells_on_house_id"
  end

  create_table "graphs", force: :cascade do |t|
    t.string "hems_id"
    t.string "postal"
    t.boolean "main"
    t.boolean "solar_generate"
    t.boolean "solar_sold"
    t.boolean "battery_charge"
    t.boolean "battery_discharge"
    t.boolean "fuel_cell"
    t.boolean "gus"
    t.boolean "water"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gus", force: :cascade do |t|
    t.float "value"
    t.datetime "timestamp"
    t.integer "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_gus_on_house_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "hems_id"
    t.string "postal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mains", force: :cascade do |t|
    t.float "value"
    t.datetime "timestamp"
    t.integer "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_mains_on_house_id"
  end

  create_table "solar_generates", force: :cascade do |t|
    t.float "value"
    t.datetime "timestamp"
    t.integer "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_solar_generates_on_house_id"
  end

  create_table "solar_sells", force: :cascade do |t|
    t.float "value"
    t.datetime "timestamp"
    t.integer "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_solar_sells_on_house_id"
  end

  create_table "waters", force: :cascade do |t|
    t.float "value"
    t.datetime "timestamp"
    t.integer "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_waters_on_house_id"
  end

end
