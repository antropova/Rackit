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

ActiveRecord::Schema.define(version: 20150430184400) do

  create_table "bikes", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bikes", ["user_id"], name: "index_bikes_on_user_id"

  create_table "boroughs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "checkins", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "corral_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "checkins", ["corral_id"], name: "index_checkins_on_corral_id"
  add_index "checkins", ["user_id"], name: "index_checkins_on_user_id"

  create_table "corrals", force: :cascade do |t|
    t.string   "location"
    t.boolean  "sheltered",     default: false
    t.integer  "racks",         default: 1
    t.integer  "borough_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "crimes",        default: 0
    t.integer  "distance",      default: 0
    t.integer  "total_rating",  default: 0
    t.integer  "total_reviews", default: 0
  end

  add_index "corrals", ["borough_id"], name: "index_corrals_on_borough_id"

  create_table "crimes", force: :cascade do |t|
    t.float    "longitude"
    t.float    "latitude"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "borough_id"
  end

  add_index "crimes", ["borough_id"], name: "index_crimes_on_borough_id"

  create_table "images", force: :cascade do |t|
    t.integer  "corral_id"
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["corral_id"], name: "index_images_on_corral_id"

  create_table "reviews", force: :cascade do |t|
    t.text     "description"
    t.integer  "rating",      default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "checkin_id"
  end

  create_table "search_suggestions", force: :cascade do |t|
    t.string   "term"
    t.integer  "popularity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "image_url"
    t.string   "location"
    t.text     "bio"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "checked_in",         default: false
    t.string   "current_location",   default: ""
    t.float    "current_latitude",   default: 0.0
    t.float    "current_longitude",  default: 0.0
    t.string   "current_sign_in_ip"
    t.boolean  "admin",              default: false
  end

end
