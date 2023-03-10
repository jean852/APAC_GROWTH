# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_18_031845) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "domain", null: false
    t.string "description"
    t.integer "founded"
    t.integer "company_size"
    t.string "country", null: false
    t.string "specialities", default: [], array: true
    t.string "tagline"
    t.string "profile_pic_url"
    t.string "background_cover_image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.bigint "client_id"
    t.bigint "company_id"
    t.bigint "expert_id"
    t.string "project_status"
    t.string "project_type"
    t.date "bidding_start"
    t.date "bidding_end"
    t.string "rfp_status"
    t.date "project_start"
    t.date "project_end"
    t.integer "project_budget"
    t.integer "project_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "countries", default: [], array: true
    t.integer "project_duration"
    t.string "project_objective"
    t.integer "intros_quantity"
    t.text "intros_type", default: [], array: true
    t.text "target_industries", default: [], array: true
    t.text "target_regions", default: [], array: true
    t.string "target_type"
    t.text "target_size", default: [], array: true
    t.string "target_company"
    t.string "target_url"
    t.string "target_country"
    t.string "target_name"
    t.text "target_ideal"
    t.text "target_seniority", default: [], array: true
    t.text "target_jobtitle", default: [], array: true
    t.text "study_elements", default: [], array: true
    t.text "study_deliverables", default: [], array: true
    t.integer "project_expert_fee"
    t.integer "project_platform_fee"
    t.integer "project_payment_fee"
    t.boolean "parameter_incognito"
    t.boolean "parameter_terms"
    t.index ["client_id"], name: "index_projects_on_client_id"
    t.index ["company_id"], name: "index_projects_on_company_id"
    t.index ["expert_id"], name: "index_projects_on_expert_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "first_name"
    t.string "last_name"
    t.string "picture_url"
    t.bigint "company_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "projects", "companies"
  add_foreign_key "projects", "users", column: "client_id"
  add_foreign_key "projects", "users", column: "expert_id"
  add_foreign_key "users", "companies"
end
