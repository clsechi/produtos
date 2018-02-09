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

ActiveRecord::Schema.define(version: 20180209041158) do

  create_table "periodicities", force: :cascade do |t|
    t.string "name"
    t.integer "period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plan_prices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_plan_id"
    t.integer "periodicity_id"
    t.decimal "value"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
    t.string "name"
    t.string "status", default: "Ativo"
    t.index ["product_id"], name: "index_product_plans_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "product_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_category_id"
    t.text "contract"
    t.string "status", default: "Ativo"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
