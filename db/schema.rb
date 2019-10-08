# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_24_001558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "token"
    t.integer "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "church_men", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "course_enrollments", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.boolean "already_paid"
    t.float "partial_payment"
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_course_enrollments_on_course_id"
    t.index ["person_id"], name: "index_course_enrollments_on_person_id"
  end

  create_table "course_progresses", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "type_of_course_id", null: false
    t.boolean "last_course", default: true
    t.date "course_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_course_progresses_on_person_id"
    t.index ["type_of_course_id"], name: "index_course_progresses_on_type_of_course_id"
  end

  create_table "course_topics", force: :cascade do |t|
    t.string "topic_name"
    t.bigint "type_of_course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["type_of_course_id"], name: "index_course_topics_on_type_of_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "total_attendes", default: 0
    t.integer "total_people_inscription", default: 0
    t.date "pre_enrollment"
    t.date "end_enrollment"
    t.integer "min_people", default: 0
    t.integer "max_people", default: 0
    t.float "amount_by_person", default: 0.0
    t.boolean "attendance_control", default: false
    t.float "total_incoming", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "type_of_course_id", null: false
    t.boolean "active", default: false
    t.string "name"
    t.index ["type_of_course_id"], name: "index_courses_on_type_of_course_id"
  end

  create_table "header_attendance_meetings", force: :cascade do |t|
    t.string "topic"
    t.date "attendance_date"
    t.float "offerings"
    t.integer "created_by_id"
    t.string "prayer"
    t.integer "validated"
    t.integer "total_attendees"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "meeting_id", null: false
    t.index ["meeting_id"], name: "index_header_attendance_meetings_on_meeting_id"
  end

  create_table "locations", force: :cascade do |t|
    t.decimal "lat"
    t.decimal "lng"
    t.string "address"
    t.string "place_id"
    t.string "custom_address"
    t.integer "locable_id"
    t.string "locable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.date "first_start_date"
    t.datetime "start_date_time"
    t.datetime "end_date_time"
    t.boolean "active"
    t.bigint "type_of_meeting_id", null: false
    t.bigint "person_id", null: false
    t.string "code"
    t.string "description"
    t.string "name"
    t.bigint "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "attendance_control", default: true
    t.index ["location_id"], name: "index_meetings_on_location_id"
    t.index ["person_id"], name: "index_meetings_on_person_id"
    t.index ["type_of_meeting_id"], name: "index_meetings_on_type_of_meeting_id"
  end

  create_table "my_titles", force: :cascade do |t|
    t.boolean "active"
    t.date "title_date"
    t.bigint "title_obtained_id", null: false
    t.bigint "person_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_my_titles_on_person_id"
    t.index ["title_obtained_id"], name: "index_my_titles_on_title_obtained_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "ci"
    t.string "phone_number"
    t.string "address"
    t.date "birthday"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "rolable_type"
    t.integer "rolable_id"
    t.string "sex", limit: 1
    t.bigint "person_id"
    t.index ["person_id"], name: "index_people_on_person_id"
  end

  create_table "person_attendance_meetings", force: :cascade do |t|
    t.boolean "attended"
    t.bigint "person_id", null: false
    t.bigint "header_attendance_meeting_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["header_attendance_meeting_id"], name: "meeting_attend"
    t.index ["person_id"], name: "index_person_attendance_meetings_on_person_id"
  end

  create_table "pre_attendance_meetings", force: :cascade do |t|
    t.bigint "type_of_meeting_id", null: false
    t.bigint "title_obtained_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title_obtained_id"], name: "index_pre_attendance_meetings_on_title_obtained_id"
    t.index ["type_of_meeting_id"], name: "index_pre_attendance_meetings_on_type_of_meeting_id"
  end

  create_table "prerequisite_courses", force: :cascade do |t|
    t.bigint "type_of_course_id", null: false
    t.bigint "dependency_type_of_course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dependency_type_of_course_id"], name: "index_prerequisite_courses_on_dependency_type_of_course_id"
    t.index ["type_of_course_id"], name: "index_prerequisite_courses_on_type_of_course_id"
  end

  create_table "title_obtaineds", force: :cascade do |t|
    t.string "title_type"
    t.string "name"
    t.integer "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "type_of_courses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "type_of_meetings", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "person_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["person_id"], name: "index_users_on_person_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "course_enrollments", "courses"
  add_foreign_key "course_enrollments", "people"
  add_foreign_key "course_progresses", "people"
  add_foreign_key "course_progresses", "type_of_courses"
  add_foreign_key "course_topics", "type_of_courses"
  add_foreign_key "courses", "type_of_courses"
  add_foreign_key "header_attendance_meetings", "meetings"
  add_foreign_key "meetings", "locations"
  add_foreign_key "meetings", "people"
  add_foreign_key "meetings", "type_of_meetings"
  add_foreign_key "my_titles", "people"
  add_foreign_key "my_titles", "title_obtaineds"
  add_foreign_key "people", "people"
  add_foreign_key "person_attendance_meetings", "header_attendance_meetings"
  add_foreign_key "person_attendance_meetings", "people"
  add_foreign_key "pre_attendance_meetings", "title_obtaineds"
  add_foreign_key "pre_attendance_meetings", "type_of_meetings"
  add_foreign_key "prerequisite_courses", "type_of_courses"
  add_foreign_key "prerequisite_courses", "type_of_courses", column: "dependency_type_of_course_id"
end
