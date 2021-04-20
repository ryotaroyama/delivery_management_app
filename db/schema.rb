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

ActiveRecord::Schema.define(version: 2021_04_19_090120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_customers_on_name", unique: true
  end

  create_table "drawing_numbers", force: :cascade do |t|
    t.integer "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_drawing_numbers_on_name", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.date "delivery_date", null: false
    t.integer "process", null: false
    t.string "comment"
    t.bigint "customer_id", null: false
    t.bigint "product_id", null: false
    t.bigint "processor_id", null: false
    t.bigint "drawing_number_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["drawing_number_id"], name: "index_orders_on_drawing_number_id"
    t.index ["processor_id"], name: "index_orders_on_processor_id"
    t.index ["product_id"], name: "index_orders_on_product_id"
  end

  create_table "processors", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_processors_on_name", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_products_on_name", unique: true
  end

  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "drawing_numbers"
  add_foreign_key "orders", "processors"
  add_foreign_key "orders", "products"
end
