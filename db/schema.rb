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

ActiveRecord::Schema.define(version: 2022_05_09_025548) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.string "email", null: false
    t.string "street1", limit: 128, null: false
    t.string "city", limit: 64, null: false
    t.string "province", limit: 64, null: false
    t.string "postal_code", limit: 5, null: false
    t.string "country_code", limit: 2, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "reference", limit: 32, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "parcels", force: :cascade do |t|
    t.integer "lenght", null: false
    t.integer "width", null: false
    t.integer "height", null: false
    t.string "dimension_unit", limit: 2, null: false
    t.integer "weight", null: false
    t.string "weight_unit", limit: 2, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shipments", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "address_from_id", null: false
    t.bigint "address_to_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_from_id"], name: "index_shipments_on_address_from_id"
    t.index ["address_to_id"], name: "index_shipments_on_address_to_id"
    t.index ["order_id"], name: "index_shipments_on_order_id"
  end

  add_foreign_key "shipments", "orders"
end
