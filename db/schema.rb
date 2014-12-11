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

ActiveRecord::Schema.define(version: 20141211053106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "answers", force: true do |t|
    t.string   "text"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_id"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "financial_rank_metadata", force: true do |t|
    t.integer "lower_age"
    t.integer "upper_age"
    t.integer "median1"
    t.integer "median10"
    t.integer "median30"
    t.integer "median50"
    t.integer "median70"
    t.integer "median90"
    t.integer "median100"
  end

  create_table "goals", force: true do |t|
    t.string   "name"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "help_tips", force: true do |t|
    t.string "title"
    t.text   "description"
  end

  create_table "income_rank_metadata", force: true do |t|
    t.integer "lower_income"
    t.integer "upper_income"
    t.decimal "percentage"
    t.decimal "percentage_below"
  end

  create_table "options", force: true do |t|
    t.integer  "stock_id"
    t.decimal  "price",              precision: 6, scale: 2
    t.integer  "volume"
    t.date     "expiry"
    t.string   "option_type"
    t.decimal  "strike",             precision: 7, scale: 2
    t.decimal  "last",               precision: 7, scale: 2
    t.decimal  "bid",                precision: 7, scale: 2
    t.decimal  "ask",                precision: 7, scale: 2
    t.integer  "open_interest"
    t.decimal  "delta",              precision: 7, scale: 4
    t.decimal  "gamma",              precision: 7, scale: 4
    t.decimal  "theta",              precision: 7, scale: 4
    t.decimal  "vega",               precision: 7, scale: 4
    t.decimal  "implied_volatility", precision: 5, scale: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plan_criteria", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_id"
    t.integer  "plan_id"
    t.integer  "answer_id"
  end

  add_index "plan_criteria", ["answer_id"], name: "index_plan_criteria_on_answer_id", using: :btree
  add_index "plan_criteria", ["plan_id"], name: "index_plan_criteria_on_plan_id", using: :btree
  add_index "plan_criteria", ["question_id"], name: "index_plan_criteria_on_question_id", using: :btree

  create_table "plans", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "goal_id"
    t.string   "about"
    t.text     "description"
    t.text     "fine_print"
    t.text     "pros"
    t.text     "cons"
    t.text     "recommendation"
    t.string   "link"
  end

  add_index "plans", ["goal_id"], name: "index_plans_on_goal_id", using: :btree

  create_table "questions", force: true do |t|
    t.string   "text"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "goal_id"
    t.string   "kind"
  end

  add_index "questions", ["goal_id"], name: "index_questions_on_goal_id", using: :btree

  create_table "retirement_rank_metadata", force: true do |t|
    t.integer "lower_age"
    t.integer "upper_age"
    t.decimal "savings_multiplier"
  end

  create_table "stocks", force: true do |t|
    t.string   "ticker"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_answers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "value"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.integer  "user_id"
  end

  add_index "user_answers", ["answer_id"], name: "index_user_answers_on_answer_id", using: :btree
  add_index "user_answers", ["question_id"], name: "index_user_answers_on_question_id", using: :btree
  add_index "user_answers", ["user_id"], name: "index_user_answers_on_user_id", using: :btree

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "goal_id"
    t.boolean  "is_guest"
    t.string   "guest_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["goal_id"], name: "index_users_on_goal_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
