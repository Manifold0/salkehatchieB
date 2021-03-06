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

ActiveRecord::Schema.define(version: 20131214205914) do

# Could not dump table "camp_assignments" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

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
    t.boolean  "status",         default: false
    t.integer  "preference1_id"
    t.integer  "preference2_id"
    t.integer  "preference3_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "camp_requests", ["user_id"], name: "index_camp_requests_on_user_id"

  create_table "camps", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "city"
    t.string   "hq_address"
    t.integer  "max_campers"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "costs" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

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

# Could not dump table "medical_forms" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "payments", force: true do |t|
    t.integer  "user_id"
    t.integer  "year"
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
<<<<<<< HEAD
=======
    t.datetime "user_approval_date"
>>>>>>> d5e912119ed0db7f18afc21ef5c4d0b385b790e6
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
    t.string   "encrypted_password",     default: ""
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
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
