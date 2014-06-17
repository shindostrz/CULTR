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

ActiveRecord::Schema.define(:version => 20140617061410) do

  create_table "categories", :force => true do |t|
    t.string   "cat_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categorizations", :force => true do |t|
    t.integer  "category_id"
    t.integer  "convo_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "categorizations", ["category_id"], :name => "index_categorizations_on_category_id"
  add_index "categorizations", ["convo_id"], :name => "index_categorizations_on_convo_id"

  create_table "convos", :force => true do |t|
    t.integer  "user_id"
    t.string   "age"
    t.text     "description", :limit => 255
    t.string   "latitude"
    t.string   "longitude"
    t.string   "start_time"
    t.string   "end_time"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.text     "loc_desc"
  end

  add_index "convos", ["user_id"], :name => "index_convos_on_user_id"

  create_table "gender_assignments", :force => true do |t|
    t.integer  "gender_id"
    t.integer  "genderable_id"
    t.string   "genderable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "gender_assignments", ["genderable_id", "genderable_type"], :name => "index_gender_assignments_on_genderable_id_and_genderable_type"

  create_table "genders", :force => true do |t|
    t.string   "gender_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "responses", :force => true do |t|
    t.integer "user_id"
    t.integer "convo_id"
  end

  add_index "responses", ["convo_id"], :name => "index_responses_on_convo_id"
  add_index "responses", ["user_id"], :name => "index_responses_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "age"
    t.string   "interests"
    t.string   "writers"
    t.string   "works"
    t.string   "quotes"
    t.string   "remember_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oath_expires_at"
  end

end
