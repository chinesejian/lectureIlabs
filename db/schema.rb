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

ActiveRecord::Schema.define(version: 20160525014830) do

  create_table "lectures", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "description",  limit: 255
    t.string   "url",          limit: 255
    t.integer  "host_user_id", limit: 4
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "state",        limit: 255, default: "unstart"
    t.date     "lecture_date"
    t.time     "lecture_time"
  end

  add_index "lectures", ["host_user_id"], name: "fk_rails_1fac0b8b76", using: :btree

  create_table "scorecards", force: :cascade do |t|
    t.integer  "overall",     limit: 4
    t.integer  "content",     limit: 4
    t.integer  "performance", limit: 4
    t.string   "comment",     limit: 255
    t.integer  "user_id",     limit: 4
    t.integer  "lecture_id",  limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "scorecards", ["lecture_id"], name: "fk_rails_b4313d7396", using: :btree
  add_index "scorecards", ["user_id"], name: "fk_rails_d4bdb5741c", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 255,             null: false
    t.string   "last_name",              limit: 255,             null: false
    t.string   "email",                  limit: 255,             null: false
    t.string   "encrypted_password",     limit: 255,             null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "lectures", "users", column: "host_user_id"
  add_foreign_key "scorecards", "lectures"
  add_foreign_key "scorecards", "users"
end
