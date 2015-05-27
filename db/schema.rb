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

ActiveRecord::Schema.define(:version => 20150527022259) do

  create_table "absents", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "location"
    t.integer  "classtype_id"
    t.integer  "level_id"
    t.date     "date"
    t.time     "time"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "answers", :force => true do |t|
    t.string   "content"
    t.integer  "question_id"
    t.integer  "weight"
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
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "strengths"
    t.boolean  "current_employee", :default => true
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

  create_table "datenight_events", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "datenight_id"
    t.date     "sac_date"
    t.date     "gb_date"
    t.date     "fol_date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "datenights", :force => true do |t|
    t.string   "image"
    t.text     "about"
    t.string   "when_time"
    t.integer  "single_price"
    t.integer  "sibling_price"
    t.string   "schedule_title"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
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
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "sort_order"
    t.integer  "classtype_id"
    t.string   "gender"
    t.string   "jack_rabbit_name"
    t.string   "color"
    t.text     "description"
    t.text     "short_description"
    t.string   "video_url"
    t.string   "image"
    t.boolean  "show_registration"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "promo_slides", :force => true do |t|
    t.string   "title"
    t.boolean  "link",       :default => false
    t.boolean  "live",       :default => false
    t.string   "data_type",  :default => "Image"
    t.string   "image"
    t.text     "html_code"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "link_path"
    t.integer  "sort_order"
  end

  create_table "questions", :force => true do |t|
    t.string   "content"
    t.integer  "survey_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "recital_ad_types", :force => true do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "word_max"
    t.string   "actual_size"
    t.boolean  "image"
    t.boolean  "pdf_file"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "recital_ads", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.text     "message"
    t.string   "image"
    t.string   "pdf_file"
    t.integer  "recital_ad_type_id"
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

  create_table "survey_results", :force => true do |t|
    t.text     "result"
    t.integer  "survey_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "feedback"
  end

  create_table "surveys", :force => true do |t|
    t.string   "name"
    t.boolean  "live"
    t.boolean  "scoreable"
    t.boolean  "image_result"
    t.string   "image"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "feedback_check"
  end

  create_table "tricks_u_categories", :force => true do |t|
    t.string   "title"
    t.integer  "weight"
    t.boolean  "hidden"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tricks_u_videos", :force => true do |t|
    t.string   "url"
    t.string   "title"
    t.integer  "weight"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "role",            :default => "author"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  create_table "worlds", :force => true do |t|
    t.string   "image"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.date     "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
