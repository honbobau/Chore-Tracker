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

ActiveRecord::Schema.define(version: 20160617195618) do

  create_table "chores", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "difficulty"
    t.boolean  "completed",    default: false
    t.integer  "user_id"
    t.integer  "group_id"
    t.integer  "rating"
    t.datetime "completed_at"
    t.boolean  "show?",        default: true
  end

  create_table "comments", force: :cascade do |t|
    t.string  "content"
    t.integer "chore_id"
    t.integer "user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string  "group_name"
    t.integer "admin_id"
  end

  create_table "users", force: :cascade do |t|
    t.string  "user_name"
    t.string  "real_name"
    t.string  "password"
    t.integer "group_id"
  end

end
