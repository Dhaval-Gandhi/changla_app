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

ActiveRecord::Schema[7.0].define(version: 2022_06_20_092102) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "item_charges", force: :cascade do |t|
    t.bigint "item_id"
    t.string "name"
    t.decimal "amount", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_charges_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "thick"
    t.string "item_id"
    t.string "item_af"
    t.string "weight"
    t.integer "unit"
    t.integer "manufactured_by"
    t.decimal "copper_price", default: "0.0"
    t.decimal "casting_labor", default: "0.0"
    t.decimal "burning_per", default: "5.0"
    t.decimal "profit_margin", default: "10.0"
    t.decimal "net_weight", default: "0.0"
    t.decimal "require_rod", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
