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

ActiveRecord::Schema.define(version: 2021_02_04_041934) do

  create_table "groups", force: :cascade do |t|
    t.integer "section_id", null: false
    t.string "name", null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_groups_on_section_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "name", null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "snippets", force: :cascade do |t|
    t.integer "group_id", null: false
    t.string "name", null: false
    t.string "content", null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_snippets_on_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "shufti_reference"
    t.string "shufti_event"
    t.string "shufti_verification_url"
    t.string "shufti_response"
    t.boolean "remittances", default: false, null: false
    t.boolean "banking", default: false, null: false
    t.string "given_name", null: false
    t.string "family_name", null: false
    t.string "email", null: false
    t.string "country", null: false
    t.string "mobile", null: false
    t.string "password_digest", null: false
    t.string "login_ip", null: false
    t.string "login_country", null: false
    t.datetime "login_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
