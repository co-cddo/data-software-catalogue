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

ActiveRecord::Schema[7.0].define(version: 2022_12_16_151505) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "organisations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "software_instances", force: :cascade do |t|
    t.string "name"
    t.bigint "organisation_id", null: false
    t.string "organisation_group"
    t.string "team"
    t.string "owner"
    t.string "product"
    t.string "provider"
    t.string "provider_contact"
    t.string "version"
    t.text "description"
    t.string "status"
    t.boolean "internal"
    t.string "license"
    t.integer "quantity_purchased"
    t.integer "quantity_used"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "packages"
    t.string "sub_organisation"
    t.index ["organisation_id"], name: "index_software_instances_on_organisation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.bigint "organisation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["organisation_id"], name: "index_users_on_organisation_id"
  end

  add_foreign_key "software_instances", "organisations"
end
