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

ActiveRecord::Schema.define(version: 2022_01_06_055250) do

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "customer_image_id"
    t.integer "roll", default: 1
    t.boolean "is_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "recepi_comments", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "recepi_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recepis", force: :cascade do |t|
    t.string "customer_id"
    t.string "recepi_title"
    t.string "recepi_describe"
    t.text "recepi_body"
    t.string "recepi_image_id", null: false
    t.integer "impressions_count"
    t.float "raty_taste"
    t.float "raty_fun"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
