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

ActiveRecord::Schema.define(version: 20150402163112) do

  create_table "blocks", force: true do |t|
    t.string   "block_number"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "block_id"
    t.string   "nickname"
  end

  create_table "photos", force: true do |t|
    t.datetime "created_at"
    t.string   "image_subject"
    t.string   "comment"
    t.string   "image"
    t.datetime "updated_at"
    t.date     "date"
    t.integer  "user_id"
    t.string   "block_number"
  end

  add_index "photos", ["user_id", "created_at"], name: "index_photos_on_user_id_and_created_at", using: :btree

  create_table "reports", force: true do |t|
    t.string   "activity"
    t.integer  "block_id"
    t.string   "comment"
    t.date     "date"
    t.string   "image"
    t.string   "plug_state"
    t.string   "plug_type"
    t.string   "pluga"
    t.integer  "plugn"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "block_number"
    t.string   "plug_placement"
    t.string   "image_subject"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
