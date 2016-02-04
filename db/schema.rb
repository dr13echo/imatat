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

ActiveRecord::Schema.define(version: 20160107143437) do

  create_table "comments", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "company_id"
    t.string   "kind",       limit: 45,   null: false
    t.string   "status"
    t.string   "body",       limit: 1024, null: false
    t.integer  "amount"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "comments", ["project_id", "company_id"], name: "index_comments_on_project_id_and_company_id"

  create_table "commitments", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "source_company_id"
    t.integer  "dest_company_id"
    t.string   "status",            limit: 45,   null: false
    t.string   "body",              limit: 1024, null: false
    t.integer  "amount"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "commitments", ["project_id", "source_company_id"], name: "index_commitments_on_project_id_and_source_company_id"

  create_table "companies", force: :cascade do |t|
    t.string   "status",                 limit: 45,                                        null: false
    t.string   "name",                   limit: 45,                                        null: false
    t.string   "busyness",               limit: 45,                                        null: false
    t.string   "zip",                    limit: 45,                                        null: false
    t.string   "prefecture",             limit: 45,                                        null: false
    t.string   "address",                limit: 45,                                        null: false
    t.integer  "make_count",                                                               null: false
    t.integer  "member_count",                                                             null: false
    t.string   "body",                   limit: 1024,                                      null: false
    t.string   "tel",                    limit: 45
    t.string   "image"
    t.decimal  "rate",                                precision: 3, scale: 8
    t.decimal  "score1",                              precision: 3, scale: 8
    t.decimal  "score2",                              precision: 3, scale: 8
    t.decimal  "score3",                              precision: 3, scale: 8
    t.decimal  "score4",                              precision: 3, scale: 8
    t.decimal  "score5",                              precision: 3, scale: 8
    t.string   "note",                   limit: 1024
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.string   "email",                                                       default: "", null: false
    t.string   "encrypted_password",                                          default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                               default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "companies", ["email"], name: "index_companies_on_email", unique: true
  add_index "companies", ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true

  create_table "projects", force: :cascade do |t|
    t.integer  "source_company_id"
    t.integer  "dest_company_id"
    t.string   "status",            limit: 45,   null: false
    t.string   "name",              limit: 45,   null: false
    t.string   "body",              limit: 1024, null: false
    t.string   "kind_body",         limit: 100,  null: false
    t.string   "kind_edge",         limit: 100,  null: false
    t.integer  "need_amount",                    null: false
    t.date     "deadline",                       null: false
    t.float    "estimated_sum",                  null: false
    t.string   "note",              limit: 1024
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "projects", ["source_company_id"], name: "index_projects_on_source_company_id"

  create_table "reviews", force: :cascade do |t|
    t.integer  "commitment_id"
    t.integer  "source_company_id"
    t.integer  "dest_company_id"
    t.string   "body",              limit: 1024, null: false
    t.integer  "score1"
    t.integer  "score2"
    t.integer  "score3"
    t.integer  "score4"
    t.integer  "score5"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "reviews", ["commitment_id", "source_company_id"], name: "index_reviews_on_commitment_id_and_source_company_id"

end
