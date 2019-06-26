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

ActiveRecord::Schema.define(version: 2019_06_26_105342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batch_products", force: :cascade do |t|
    t.bigint "batch_id"
    t.bigint "product_id"
    t.integer "threshold"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_batch_products_on_batch_id"
    t.index ["product_id"], name: "index_batch_products_on_product_id"
  end

  create_table "batches", force: :cascade do |t|
    t.string "city"
    t.integer "number"
    t.date "start_date"
    t.date "end_date"
    t.integer "headcount"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.date "date"
    t.integer "qty"
    t.text "note"
    t.bigint "batch_product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_product_id"], name: "index_deliveries_on_batch_product_id"
  end

  create_table "forecasts", force: :cascade do |t|
    t.bigint "batch_product_id"
    t.bigint "delivery_id"
    t.float "rotation"
    t.date "date"
    t.integer "qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_product_id"], name: "index_forecasts_on_batch_product_id"
    t.index ["delivery_id"], name: "index_forecasts_on_delivery_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "emoji"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "batch_products", "batches"
  add_foreign_key "batch_products", "products"
  add_foreign_key "deliveries", "batch_products"
  add_foreign_key "forecasts", "batch_products"
  add_foreign_key "forecasts", "deliveries"
end
