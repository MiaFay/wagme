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

ActiveRecord::Schema.define(version: 20160729154456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dogs", force: :cascade do |t|
    t.string  "dog_name",   limit: 50, null: false
    t.string  "breed",      limit: 50, null: false
    t.string  "sex"
    t.boolean "neutered"
    t.boolean "vaccinated"
    t.text    "temperment",            null: false
    t.integer "age"
    t.integer "user_id",               null: false
  end

  add_index "dogs", ["user_id"], name: "index_dogs_on_user_id", using: :btree

  create_table "meetups", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.string   "location",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id",     null: false
  end

  create_table "user_meetups", force: :cascade do |t|
    t.integer "user_id",   null: false
    t.integer "meetup_id", null: false
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar"
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "city",                                null: false
    t.string   "state",                               null: false
    t.string   "zip",                                 null: false
    t.integer  "dog_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "dogs", "users"
end
