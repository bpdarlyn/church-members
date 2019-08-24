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

ActiveRecord::Schema.define(version: 2019_08_24_081052) do

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
  end

  create_table "pre_attendance_meetings", force: :cascade do |t|
    t.bigint "type_of_meeting_id", null: false
    t.bigint "title_obtained_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title_obtained_id"], name: "index_pre_attendance_meetings_on_title_obtained_id"
    t.index ["type_of_meeting_id"], name: "index_pre_attendance_meetings_on_type_of_meeting_id"
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

  add_foreign_key "my_titles", "people"
  add_foreign_key "my_titles", "title_obtaineds"
  add_foreign_key "pre_attendance_meetings", "title_obtaineds"
  add_foreign_key "pre_attendance_meetings", "type_of_meetings"
end
