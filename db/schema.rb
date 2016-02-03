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

ActiveRecord::Schema.define(version: 20160202140650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auto_applications", force: :cascade do |t|
    t.integer  "hunter_id"
    t.string   "location"
    t.string   "job_type"
    t.string   "status"
    t.string   "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "auto_applications", ["hunter_id"], name: "index_auto_applications_on_hunter_id", using: :btree

  create_table "availabilities", force: :cascade do |t|
    t.integer  "hunter_id"
    t.boolean  "mon_m"
    t.boolean  "mon_a"
    t.boolean  "mon_e"
    t.boolean  "mon_l"
    t.boolean  "tue_m"
    t.boolean  "tue_a"
    t.boolean  "tue_e"
    t.boolean  "tue_l"
    t.boolean  "wed_m"
    t.boolean  "wed_a"
    t.boolean  "wed_e"
    t.boolean  "wed_l"
    t.boolean  "thur_m"
    t.boolean  "thur_a"
    t.boolean  "thur_e"
    t.boolean  "thur_l"
    t.boolean  "fri_m"
    t.boolean  "fri_a"
    t.boolean  "fri_e"
    t.boolean  "fri_l"
    t.boolean  "sat_m"
    t.boolean  "sat_a"
    t.boolean  "sat_e"
    t.boolean  "sat_l"
    t.boolean  "sun_m"
    t.boolean  "sun_a"
    t.boolean  "sun_e"
    t.boolean  "sun_l"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "availabilities", ["hunter_id"], name: "index_availabilities_on_hunter_id", using: :btree

  create_table "available_times", force: :cascade do |t|
    t.string   "morning",    default: "1"
    t.string   "afternoon",  default: "1"
    t.string   "evening",    default: "1"
    t.string   "late",       default: "0"
    t.string   "day"
    t.integer  "hunter_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "available_times", ["hunter_id"], name: "index_available_times_on_hunter_id", using: :btree

  create_table "business_hours", force: :cascade do |t|
    t.time     "opens_at"
    t.time     "closes_at"
    t.string   "day"
    t.integer  "business_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "business_hours", ["business_id"], name: "index_business_hours_on_business_id", using: :btree

  create_table "business_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "businesses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "business_type"
    t.string   "address"
    t.string   "postcode"
    t.string   "city"
    t.string   "phone"
    t.string   "website"
    t.string   "facebook"
    t.string   "google_plus"
    t.string   "instagram"
    t.string   "twitter"
    t.text     "tagline"
    t.text     "about"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "cover_image_file_name"
    t.string   "cover_image_content_type"
    t.integer  "cover_image_file_size"
    t.datetime "cover_image_updated_at"
    t.string   "form"
  end

  create_table "educations", force: :cascade do |t|
    t.integer  "hunter_id"
    t.string   "institution"
    t.string   "qualification"
    t.string   "subject"
    t.string   "result"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "comment"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "educations", ["hunter_id"], name: "index_educations_on_hunter_id", using: :btree

  create_table "experiences", force: :cascade do |t|
    t.integer  "hunter_id"
    t.string   "job_title"
    t.string   "job_category"
    t.string   "employer"
    t.string   "location"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "tagline"
    t.text     "job_description"
    t.text     "roles_and_responsibilities"
    t.text     "personal_comment"
    t.string   "current_role"
    t.string   "customer_facing"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "category"
  end

  add_index "experiences", ["hunter_id"], name: "index_experiences_on_hunter_id", using: :btree

  create_table "galleries", force: :cascade do |t|
    t.integer  "business_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "galleries", ["business_id"], name: "index_galleries_on_business_id", using: :btree

  create_table "hunters", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.string   "nationality"
    t.string   "location"
    t.string   "phone"
    t.string   "seeking"
    t.string   "tagline"
    t.string   "driving_licence"
    t.text     "summary"
    t.text     "interests"
    t.text     "teamwork"
    t.text     "communication"
    t.text     "customer_service"
    t.text     "responsibility"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "cover_photo_file_name"
    t.string   "cover_photo_content_type"
    t.integer  "cover_photo_file_size"
    t.datetime "cover_photo_updated_at"
    t.string   "form"
  end

  create_table "impressions", force: :cascade do |t|
    t.string   "trackable_type"
    t.integer  "trackable_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "job_brackets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_wages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "language_levels", force: :cascade do |t|
    t.string   "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "language_names", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.integer  "hunter_id"
    t.string   "name"
    t.string   "level"
    t.string   "spoken_level"
    t.string   "written_level"
    t.string   "reading_level"
    t.text     "comment"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "languages", ["hunter_id"], name: "index_languages_on_hunter_id", using: :btree

  create_table "london_areas", force: :cascade do |t|
    t.string   "name"
    t.string   "postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nationalities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "gallery_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "photos", ["gallery_id"], name: "index_photos_on_gallery_id", using: :btree

  create_table "position_advertisements", force: :cascade do |t|
    t.integer  "position_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "closed_at"
    t.datetime "deleted_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "position_advertisements", ["deleted_at"], name: "index_position_advertisements_on_deleted_at", using: :btree
  add_index "position_advertisements", ["position_id"], name: "index_position_advertisements_on_position_id", using: :btree

  create_table "position_applications", force: :cascade do |t|
    t.integer  "hunter_id"
    t.integer  "position_advertisement_id"
    t.datetime "rejected_at"
    t.datetime "cancelled_at"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.datetime "deleted_at"
  end

  add_index "position_applications", ["deleted_at"], name: "index_position_applications_on_deleted_at", using: :btree
  add_index "position_applications", ["hunter_id"], name: "index_position_applications_on_hunter_id", using: :btree
  add_index "position_applications", ["position_advertisement_id"], name: "index_position_applications_on_position_advertisement_id", using: :btree

  create_table "positions", force: :cascade do |t|
    t.integer  "business_id"
    t.string   "title"
    t.string   "category"
    t.string   "bracket"
    t.string   "rank"
    t.string   "openings"
    t.string   "start_date"
    t.string   "weekly_hours"
    t.string   "wage"
    t.string   "age_restricted"
    t.string   "customer_facing"
    t.string   "dress_code"
    t.string   "tips"
    t.text     "tagline"
    t.text     "description"
    t.text     "roles_and_responsibilities"
    t.text     "desired_sqa"
    t.datetime "deleted_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.float    "longitude"
    t.float    "latitude"
    t.string   "status"
    t.string   "business_type"
    t.string   "postcode"
    t.string   "form"
    t.string   "area"
    t.string   "bracket_name"
    t.string   "category_name"
  end

  add_index "positions", ["business_id"], name: "index_positions_on_business_id", using: :btree
  add_index "positions", ["deleted_at"], name: "index_positions_on_deleted_at", using: :btree

  create_table "searches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "address"
    t.string   "postcode"
    t.string   "city"
    t.float    "latitude"
    t.float    "longitude"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "weekly_hours", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "auto_applications", "hunters"
  add_foreign_key "available_times", "hunters"
  add_foreign_key "business_hours", "businesses"
  add_foreign_key "educations", "hunters"
  add_foreign_key "experiences", "hunters"
  add_foreign_key "galleries", "businesses"
  add_foreign_key "impressions", "users"
  add_foreign_key "languages", "hunters"
  add_foreign_key "photos", "galleries"
  add_foreign_key "position_advertisements", "positions"
  add_foreign_key "position_applications", "hunters"
  add_foreign_key "position_applications", "position_advertisements"
  add_foreign_key "positions", "businesses"
end
