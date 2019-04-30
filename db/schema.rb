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

ActiveRecord::Schema.define(version: 20190228010113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "absents", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "location"
    t.integer  "classtype_id"
    t.integer  "level_id"
    t.date     "date"
    t.time     "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses", force: :cascade do |t|
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "addresses", ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", using: :btree

  create_table "bff_dance_parties", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.string   "suggestion"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.time     "granite_bay_start_time"
    t.integer  "granite_bay_duration"
    t.time     "folsom_start_time"
    t.integer  "folsom_duration"
    t.time     "sacramento_start_time"
    t.integer  "sacramento_duration"
    t.string   "image"
  end

  create_table "bubble_contents", force: :cascade do |t|
    t.string   "link"
    t.string   "image"
    t.string   "color"
    t.string   "text"
    t.string   "text_color"
    t.boolean  "show_button"
    t.integer  "sort_order"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "camps", force: :cascade do |t|
    t.string   "title"
    t.date     "registration_opens"
    t.date     "registration_closes"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "classtypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coach_classtypes", force: :cascade do |t|
    t.integer  "classtype_id"
    t.integer  "coach_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coach_levels", force: :cascade do |t|
    t.integer  "level_id"
    t.integer  "coach_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coach_locations", force: :cascade do |t|
    t.integer  "coach_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coaches", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "strengths"
    t.boolean  "current_employee", default: true
    t.string   "tag_image"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "comment"
    t.string   "name"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "activity"
    t.string   "email"
  end

  create_table "datenight_events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "datenight_id"
    t.date     "sac_date"
    t.date     "gb_date"
    t.date     "fol_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "datenights", force: :cascade do |t|
    t.string   "image"
    t.text     "about"
    t.string   "when_time"
    t.integer  "single_price"
    t.integer  "sibling_price"
    t.string   "schedule_title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discontinue_notices", force: :cascade do |t|
    t.string   "reason"
    t.string   "student_first_name"
    t.string   "student_last_name"
    t.integer  "location"
    t.integer  "class_day"
    t.time     "class_time"
    t.date     "last_day"
    t.string   "parent_name"
    t.boolean  "understood"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employment_applications", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "middlename"
    t.string   "image"
    t.string   "resume"
    t.boolean  "granite_bay"
    t.boolean  "folsom"
    t.boolean  "sacramento"
    t.boolean  "gymnastics"
    t.boolean  "dance"
    t.boolean  "swim"
    t.boolean  "tag"
    t.boolean  "hospitality"
    t.string   "phone"
    t.boolean  "mornings"
    t.boolean  "saturdays"
    t.text     "previous_experience"
    t.text     "experience_with_children"
    t.text     "previous_office_experience"
    t.text     "customer_service_experience"
    t.text     "reason"
    t.string   "email"
    t.string   "position_desired"
    t.boolean  "over_eighteen"
    t.boolean  "can_drive"
    t.boolean  "can_commit_one_year"
    t.string   "expected_pay"
    t.integer  "desired_hours"
    t.date     "date_available"
    t.text     "job_requirements_response"
    t.string   "high_school_year"
    t.string   "high_school_graduation_year"
    t.string   "high_school_name"
    t.string   "college_year"
    t.string   "college_graduation_year"
    t.string   "college_name"
    t.string   "college_degree"
    t.text     "hobbies"
    t.boolean  "continuing_education"
    t.string   "do_not_contact_employer"
    t.text     "do_not_contact_reason"
    t.boolean  "convicted"
    t.text     "convictions"
    t.date     "interview_date"
    t.string   "interviewed_by"
    t.string   "status"
    t.string   "comment"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "archived"
  end

  create_table "employment_histories", force: :cascade do |t|
    t.integer  "history_id"
    t.string   "history_type"
    t.string   "company_name"
    t.string   "supervisor_name"
    t.string   "job_title"
    t.text     "description"
    t.string   "phone"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "reason_for_leaving"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "employment_histories", ["history_type", "history_id"], name: "index_employment_histories_on_history_type_and_history_id", using: :btree

  create_table "kid_quotes", force: :cascade do |t|
    t.text     "quote"
    t.string   "name"
    t.integer  "age"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kids_night_outs", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.text     "details"
    t.time     "sac_time"
    t.time     "fol_time"
    t.time     "gb_time"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "levels", force: :cascade do |t|
    t.string   "levelname"
    t.integer  "length"
    t.float    "price"
    t.string   "age"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "shortname"
  end

  create_table "parties", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "video"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "color"
    t.string   "activities"
    t.integer  "sort_order"
  end

  create_table "promo_slides", force: :cascade do |t|
    t.string   "title"
    t.boolean  "link",       default: false
    t.boolean  "live",       default: false
    t.string   "data_type",  default: "Image"
    t.string   "image"
    t.text     "html_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link_path"
    t.integer  "sort_order"
  end

  create_table "recital_ad_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "word_max"
    t.string   "actual_size"
    t.boolean  "image"
    t.boolean  "pdf_file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recital_ads", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.text     "message"
    t.string   "image"
    t.string   "pdf_file"
    t.integer  "recital_ad_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recital_sign_ups", force: :cascade do |t|
    t.string   "child_first_name"
    t.string   "child_last_name"
    t.integer  "location"
    t.boolean  "participating"
    t.integer  "total_recitals"
    t.boolean  "multiple_recitals"
    t.boolean  "multiple_children"
    t.string   "costume_fee_agreement"
    t.string   "recital_fee_agreement"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "tricks_u_categories", force: :cascade do |t|
    t.string   "title"
    t.integer  "weight"
    t.boolean  "hidden"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tricks_u_videos", force: :cascade do |t|
    t.string   "url"
    t.string   "title"
    t.integer  "weight"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "role",            default: "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "website_pdfs", force: :cascade do |t|
    t.string   "file"
    t.string   "file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
