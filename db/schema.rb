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

ActiveRecord::Schema[7.0].define(version: 2022_05_28_081110) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "merchants", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "cif", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cif"], name: "index_merchants_on_cif", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "merchant_id"
    t.bigint "shopper_id"
    t.float "amount"
    t.float "disbursed_amount"
    t.float "fee"
    t.integer "status", default: 0
    t.datetime "completed_at"
    t.datetime "disbursed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchant_id"], name: "index_orders_on_merchant_id"
    t.index ["shopper_id"], name: "index_orders_on_shopper_id"
  end

  create_table "shoppers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "nif"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
