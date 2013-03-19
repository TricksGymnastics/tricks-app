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

ActiveRecord::Schema.define(:version => 20130317002620) do

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "classtypes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "coach_classtypes", :force => true do |t|
    t.integer  "classtype_id"
    t.integer  "coach_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "coach_levels", :force => true do |t|
    t.integer  "level_id"
    t.integer  "coach_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "coach_locations", :force => true do |t|
    t.integer  "coach_id"
    t.integer  "location_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "coaches", :force => true do |t|
    t.string   "image"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "gender"
    t.date     "birthdate"
    t.date     "startdate"
    t.text     "experience"
    t.string   "fav_event"
    t.string   "fav_skill"
    t.string   "fav_food"
    t.text     "advice"
    t.string   "disney_char"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "classtype_id"
  end

  create_table "comments", :force => true do |t|
    t.text     "comment"
    t.string   "name"
    t.integer  "score"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "activity"
    t.string   "email"
  end

  create_table "kid_quotes", :force => true do |t|
    t.text     "quote"
    t.string   "name"
    t.integer  "age"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "levels", :force => true do |t|
    t.string   "levelname"
    t.integer  "length"
    t.integer  "price"
    t.string   "age"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "sort_order"
    t.integer  "classtype_id"
    t.string   "gender"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "questions", :force => true do |t|
    t.integer  "survey_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "recital_ad_fields", :force => true do |t|
    t.string   "name"
    t.string   "field_type"
    t.boolean  "required"
    t.integer  "recital_ad_type_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "recital_ad_fields", ["recital_ad_type_id"], :name => "index_recital_ad_fields_on_recital_ad_type_id"

  create_table "recital_ad_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "recital_ads", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.integer  "recital_ad_type_id"
    t.text     "properties"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "schedules", :force => true do |t|
    t.string   "level"
    t.string   "day"
    t.string   "teacher"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "location"
    t.integer  "level_id"
    t.integer  "classtype_id"
    t.time     "time"
    t.boolean  "future_class",  :default => false
    t.boolean  "recital_class", :default => false
  end

  create_table "surveys", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "role",            :default => "author"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

end
