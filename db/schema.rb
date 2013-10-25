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

ActiveRecord::Schema.define(:version => 20131025000446) do

  create_table "convos", :force => true do |t|
    t.integer  "user_id"
    t.string   "topic"
    t.string   "age"
    t.string   "gender"
    t.text     "description", :limit => 255
    t.string   "latitude"
    t.string   "longitude"
    t.string   "start_time"
    t.string   "end_time"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.text     "loc_desc"
  end

  create_table "convos_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "convo_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "age"
    t.string   "gender"
    t.string   "interests"
    t.string   "writers"
    t.string   "works"
    t.string   "quotes"
    t.string   "remember_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
