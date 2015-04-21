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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20150417154457) do
=======
<<<<<<< HEAD
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20150417154457) do
=======
ActiveRecord::Schema.define(version: 20150420180702) do
>>>>>>> fdc9f16ec159b30298489150ed4ff43e7f9d000d
=======
ActiveRecord::Schema.define(version: 20150420211008) do
>>>>>>> 3b44cf9babc3bcd5be61d36e1f57ec8a3a71232d
>>>>>>> 91642f2d6cf916151ae7763e7bcca509fe395c5d

  create_table "bike_corrals", force: :cascade do |t|
    t.integer  "bike_id"
    t.integer  "corral_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bike_corrals", ["bike_id"], name: "index_bike_corrals_on_bike_id"
  add_index "bike_corrals", ["corral_id"], name: "index_bike_corrals_on_corral_id"

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
    t.integer  "crime_id"
  end

  add_index "boroughs", ["crime_id"], name: "index_boroughs_on_crime_id"

  create_table "corrals", force: :cascade do |t|
    t.string   "location"
    t.boolean  "sheltered",  default: false
    t.integer  "racks",      default: 1
    t.integer  "borough_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "corrals", ["borough_id"], name: "index_corrals_on_borough_id"

  create_table "crimes", force: :cascade do |t|
    t.float    "longitude"
    t.float    "latitude"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "description"
    t.integer  "rating"
    t.integer  "bike_corral_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "reviews", ["bike_corral_id"], name: "index_reviews_on_bike_corral_id"

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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
<<<<<<< HEAD
    t.string   "ip_address"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "picture"
=======
<<<<<<< HEAD
    t.string   "ip_address"
    t.float    "longitude"
    t.float    "latitude"
<<<<<<< HEAD
    t.string   "picture"
=======
>>>>>>> fdc9f16ec159b30298489150ed4ff43e7f9d000d
=======
>>>>>>> 3b44cf9babc3bcd5be61d36e1f57ec8a3a71232d
>>>>>>> 91642f2d6cf916151ae7763e7bcca509fe395c5d
  end

end
