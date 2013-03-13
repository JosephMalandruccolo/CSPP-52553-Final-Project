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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130313064848) do

  create_table "colleges", :force => true do |t|
    t.string   "officialName"
    t.string   "shortName"
    t.string   "city"
    t.string   "state"
    t.string   "seal_image_uid"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "wikipedia"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "website"
    t.string   "seal_image_name"
  end

  create_table "photos", :force => true do |t|
    t.string   "photo_image_uid"
    t.string   "photo_image_name"
    t.integer  "user_id"
    t.integer  "college_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "photos", ["college_id"], :name => "index_photos_on_college_id"

  create_table "statuses", :force => true do |t|
    t.integer  "user_id"
    t.integer  "college_id"
    t.string   "relationship"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "statuses", ["college_id"], :name => "index_statuses_on_college_id"
  add_index "statuses", ["user_id", "college_id"], :name => "index_statuses_on_user_id_and_college_id", :unique => true
  add_index "statuses", ["user_id"], :name => "index_statuses_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.string   "password_digest"
    t.string   "gender"
    t.string   "birthMonth"
    t.integer  "birthday"
    t.integer  "birthYear"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
