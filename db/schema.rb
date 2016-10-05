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

ActiveRecord::Schema.define(version: 20161003184741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "category_leaderboards", force: :cascade do |t|
    t.string   "placements",  default: "1,2,3"
    t.integer  "game_id"
    t.string   "title"
    t.string   "rules"
    t.string   "speedrun_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.string   "artwork_url"
    t.string   "speedrun_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "runners", force: :cascade do |t|
    t.string   "username"
    t.string   "stream_url"
    t.integer  "twitch_id"
    t.string   "speedrun_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "runs", force: :cascade do |t|
    t.string   "speedrun_id"
    t.integer  "runner_id"
    t.integer  "category_leaderboard_id"
    t.string   "run_url"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "saved_runs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "run_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
