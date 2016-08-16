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

ActiveRecord::Schema.define(version: 20160815233008) do

  create_table "companies", force: :cascade do |t|
    t.string   "name_co"
    t.string   "ceo_co"
    t.string   "page"
    t.string   "type_co"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "born"
    t.string   "ocupation"
    t.string   "soc_stat"
    t.string   "page"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_people_on_user_id"
  end

  create_table "relations", force: :cascade do |t|
    t.string   "sudo"
    t.integer  "company_id"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_relations_on_company_id"
    t.index ["person_id"], name: "index_relations_on_person_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
    t.string   "profile"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
