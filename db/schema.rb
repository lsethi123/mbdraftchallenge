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

ActiveRecord::Schema.define(version: 20170314201200) do

  create_table "actuals", force: :cascade do |t|
    t.string   "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "draftee_id"
    t.integer  "number"
    t.integer  "team_id"
    t.integer  "pick_id"
  end

  create_table "draftees", force: :cascade do |t|
    t.string   "info"
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mypicks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "pick_id"
    t.integer  "user_id"
  end

  create_table "picks", force: :cascade do |t|
    t.boolean  "round"
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "team_id"
    t.integer  "draftee_id"
    t.integer  "order"
    t.integer  "user_id"
    t.integer  "second_id"
    t.integer  "num2"
    t.integer  "actual_id"
    t.integer  "score1"
  end

  add_index "picks", ["user_id"], name: "index_picks_on_user_id"

  create_table "seconds", force: :cascade do |t|
    t.string   "info"
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "logo"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.text     "notes"
    t.string   "helmet"
    t.string   "helmet_file_name"
    t.string   "helmet_content_type"
    t.integer  "helmet_file_size"
    t.datetime "helmet_updated_at"
    t.string   "drafted"
    t.integer  "draftee_id"
    t.integer  "second_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
