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

ActiveRecord::Schema.define(version: 20150617030414) do

  create_table "add_username_to_users", force: :cascade do |t|
    t.string   "username",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "booking_tour_category_tours", force: :cascade do |t|
    t.integer  "tour_id",          limit: 4
    t.integer  "booking_id",       limit: 4
    t.integer  "tour_category_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "booking_tours", force: :cascade do |t|
    t.integer "booking_id", limit: 4
    t.integer "tour_id",    limit: 4
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "travel_date"
    t.integer  "user_id",              limit: 4
    t.string   "status",               limit: 255
    t.string   "itinerary",            limit: 255
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "name",                 limit: 255
    t.integer  "customer_id",          limit: 4
    t.datetime "travel_to"
    t.string   "contact_number",       limit: 255
    t.integer  "number_adult",         limit: 4
    t.integer  "number_child",         limit: 4
    t.string   "booking_number",       limit: 255
    t.boolean  "check_send_itinerary", limit: 1,   default: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "competitors", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "vendor_rate_id", limit: 4
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "email_address",  limit: 255
    t.string   "contact_number", limit: 255
    t.string   "address",        limit: 255
    t.integer  "country_id",     limit: 4
    t.integer  "source_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "incoming_comments", force: :cascade do |t|
    t.integer  "incoming_id", limit: 4
    t.integer  "user_id",     limit: 4
    t.text     "content",     limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "incomings", force: :cascade do |t|
    t.string   "customer_name", limit: 255
    t.string   "email_address", limit: 255
    t.string   "title",         limit: 255
    t.text     "content",       limit: 65535
    t.string   "source_info",   limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "lead_tour_category_tours", force: :cascade do |t|
    t.integer  "tour_id",          limit: 4
    t.integer  "lead_id",          limit: 4
    t.integer  "tour_category_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "leading_tours", force: :cascade do |t|
    t.integer "lead_id", limit: 4
    t.integer "tour_id", limit: 4
  end

  create_table "leads", force: :cascade do |t|
    t.integer  "customer_id",    limit: 4
    t.date     "travel_from"
    t.date     "travel_to"
    t.string   "contact_number", limit: 255
    t.integer  "adults",         limit: 4
    t.integer  "children",       limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "status",         limit: 255
    t.integer  "user_id",        limit: 4
  end

  create_table "mtq_slots", force: :cascade do |t|
    t.datetime "date"
    t.integer  "available_slot", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "vendor_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "season_room_prices", force: :cascade do |t|
    t.integer  "season_id",      limit: 4
    t.integer  "room_id",        limit: 4
    t.float    "price",          limit: 24
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "rate_type",      limit: 4
    t.integer  "competitor_id",  limit: 4
    t.integer  "vendor_rate_id", limit: 4
  end

  create_table "seasons", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sources", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tour_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tours", force: :cascade do |t|
    t.string   "code",             limit: 255
    t.string   "name",             limit: 255
    t.integer  "tour_category_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lead_id",          limit: 4
    t.integer  "booking_id",       limit: 4
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "group",                  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               limit: 255
    t.integer  "department_id",          limit: 4
    t.string   "contact_number",         limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vendor_categories", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "number_vendor", limit: 4
  end

  create_table "vendor_rates", force: :cascade do |t|
    t.string   "name",                       limit: 255
    t.integer  "vendor_category_id",         limit: 4
    t.integer  "city_id",                    limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "vendor_id",                  limit: 4
    t.date     "effective"
    t.date     "expired"
    t.integer  "rate_type",                  limit: 4
    t.string   "remarks",                    limit: 255
    t.integer  "competitor_id",              limit: 4
    t.string   "contract_file_file_name",    limit: 255
    t.string   "contract_file_content_type", limit: 255
    t.integer  "contract_file_file_size",    limit: 4
    t.datetime "contract_file_updated_at"
    t.string   "competitor_name",            limit: 255
  end

  create_table "vendors", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "vendor_type",        limit: 255
    t.string   "email",              limit: 255
    t.string   "contact",            limit: 255
    t.string   "fax",                limit: 255
    t.integer  "city_id",            limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "vendor_category_id", limit: 4
    t.integer  "user_create_id",     limit: 4
    t.integer  "user_update_id",     limit: 4
  end

end
