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

ActiveRecord::Schema.define(version: 20180202182427) do

  create_table "periodicities", force: :cascade do |t|
    t.string "name"
    t.integer "period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plan_prices", force: :cascade do |t|
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_plan_id"
    t.integer "periodicity_id"
    t.index ["periodicity_id"], name: "index_plan_prices_on_periodicity_id"
    t.index ["product_plan_id"], name: "index_plan_prices_on_product_plan_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_plans", force: :cascade do |t|
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
    t.index ["product_id"], name: "index_product_plans_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "product_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_category_id"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

end
