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

ActiveRecord::Schema.define(version: 20160323163130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.text     "name"
    t.string   "ombd_id"
    t.string   "ombd_poster"
    t.string   "youtube"
    t.string   "playing_now"
    t.string   "upcoming"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "rating"
  end

  create_table "ticket_details", force: :cascade do |t|
    t.string   "ticket_style"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "ticket_cost"
  end

  create_table "ticket_purchases", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "age_confirm"
    t.string   "cc_number"
    t.string   "cc_cvc"
    t.string   "cc_exp"
    t.string   "final_cost"
    t.string   "zip_code"
    t.integer  "movie_id"
    t.integer  "viewing_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "viewing_rooms", force: :cascade do |t|
    t.integer  "room_number"
    t.integer  "seat_max"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "viewings", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "viewing_room_id"
    t.string   "view_time"
    t.date     "view_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
