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

ActiveRecord::Schema.define(version: 20131105205020) do

  create_table "camp_permission_forms", force: true do |t|
    t.integer  "user_id"
    t.string   "type"
    t.string   "relationship"
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "business"
    t.string   "work_phone_number"
    t.string   "phone_number"
    t.string   "signature_of_guardian"
    t.boolean  "approval"
    t.string   "camp"
    t.datetime "printed_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "camp_permission_forms", ["user_id"], name: "index_camp_permission_forms_on_user_id"

  create_table "camp_requests", force: true do |t|
    t.integer  "user_id"
    t.boolean  "status"
    t.string   "preference1"
    t.string   "preference2"
    t.string   "preference3"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "camp_requests", ["user_id"], name: "index_camp_requests_on_user_id"

  create_table "costs", force: true do |t|
    t.date     "year"
    t.float    "amount"
    t.integer  "admin_approver_id"
    t.date     "approved_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "covenant_forms", force: true do |t|
    t.integer  "user_id"
    t.boolean  "policy"
    t.boolean  "two_adult"
    t.boolean  "training"
    t.boolean  "report_abuse"
    t.boolean  "child_abuse"
    t.boolean  "agree_to_covenant"
    t.string   "user_signature"
    t.date     "signature_date"
    t.datetime "printed_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "covenant_forms", ["user_id"], name: "index_covenant_forms_on_user_id"

  create_table "events", force: true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.text     "description"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "email"
    t.string   "city"
    t.string   "zip"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medical_forms", force: true do |t|
    t.integer  "user_id"
    t.integer  "camp_id"
    t.text     "information"
    t.string   "insurance_card_image"
    t.string   "physician_name"
    t.string   "physician_number"
    t.string   "physician_address_1"
    t.string   "physician_address_2"
    t.string   "physician_city"
    t.string   "physician_state"
    t.string   "physician_zip"
    t.string   "health_insurance_company"
    t.string   "policy_number"
    t.string   "company_address"
    t.string   "company_number"
    t.string   "health_insurance_agent"
    t.text     "allergies"
    t.text     "diet_restrictions"
    t.text     "recent_illness_injury"
    t.text     "medications"
    t.text     "additional_conditions"
    t.date     "date_of_last_tetanus_shot"
    t.boolean  "user_approval"
    t.date     "user_approval_date"
    t.boolean  "guardian_approval"
    t.date     "guardian_approval_date"
    t.datetime "printed_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "medical_forms", ["camp_id"], name: "index_medical_forms_on_camp_id"
  add_index "medical_forms", ["user_id"], name: "index_medical_forms_on_user_id"

  create_table "payments", force: true do |t|
    t.integer  "user_id"
    t.date     "year"
    t.float    "amount"
    t.string   "identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["user_id"], name: "index_payments_on_user_id"

  create_table "photos", force: true do |t|
    t.integer  "user_id"
    t.integer  "site_id"
    t.boolean  "approval"
    t.text     "users_tagged"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["user_id"], name: "index_photos_on_user_id"

  create_table "questionnaires", force: true do |t|
    t.string   "occupation"
    t.string   "why_participate"
    t.integer  "carpentry"
    t.integer  "plumbing"
    t.integer  "electrical"
    t.integer  "roofing"
    t.integer  "song_leader"
    t.integer  "bible"
    t.integer  "recreation"
    t.integer  "lifeguard"
    t.integer  "accounting"
    t.integer  "firstaid"
    t.boolean  "cpr_firstaid"
    t.string   "camp"
    t.string   "year"
    t.boolean  "site_leader"
    t.text     "involved_activities"
    t.boolean  "camp_director_approval"
    t.date     "camp_director_approval_date"
    t.boolean  "user_approval"
    t.date     "user_approval_date"
    t.datetime "printed_date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questionnaires", ["user_id"], name: "index_questionnaires_on_user_id"

  create_table "reference_forms", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.string   "relationship"
    t.boolean  "approval_status"
    t.boolean  "reviewed_by_camp_director"
    t.datetime "printed_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reference_forms", ["user_id"], name: "index_reference_forms_on_user_id"

  create_table "schedules", force: true do |t|
    t.integer  "camp_id"
    t.date     "day"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schedules", ["camp_id"], name: "index_schedules_on_camp_id"
  add_index "schedules", ["event_id"], name: "index_schedules_on_event_id"

  create_table "sites", force: true do |t|
    t.string   "homeowner"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "preferred_name"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "zip"
    t.string   "state"
    t.string   "district"
    t.string   "gender"
    t.string   "tshirt_size"
    t.date     "date_of_birth"
    t.string   "phone_number"
    t.string   "mobile_devices"
    t.string   "service_provider"
    t.string   "church"
    t.string   "church_city"
    t.string   "church_pastor"
    t.integer  "permission_level"
    t.boolean  "background_check"
    t.date     "background_check_date"
    t.string   "photoID"
    t.string   "signatureID"
    t.integer  "camp_id"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
