# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160224222510) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "phone",      limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "active",                 default: true
  end

  create_table "foods", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.string   "food_type",   limit: 255
    t.decimal  "price",                     precision: 9, scale: 2
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.boolean  "active",                                            default: true
  end

  create_table "foods_orders", force: :cascade do |t|
    t.integer  "food_id",    limit: 4
    t.integer  "order_id",   limit: 4
    t.integer  "amount",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "foods_orders", ["food_id"], name: "index_foods_orders_on_food_id", using: :btree
  add_index "foods_orders", ["order_id"], name: "index_foods_orders_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "waiter_id",   limit: 4
    t.integer  "customer_id", limit: 4
    t.integer  "table_id",    limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "status",      limit: 255
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree
  add_index "orders", ["table_id"], name: "index_orders_on_table_id", using: :btree
  add_index "orders", ["waiter_id"], name: "index_orders_on_waiter_id", using: :btree

  create_table "tables", force: :cascade do |t|
    t.boolean  "in_use"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "waiters", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "phone",      limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "active",                 default: true
  end

  add_foreign_key "foods_orders", "foods"
  add_foreign_key "foods_orders", "orders"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "tables"
  add_foreign_key "orders", "waiters"
end
