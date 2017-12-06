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

ActiveRecord::Schema.define(version: 20171205220711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bugs", force: :cascade do |t|
    t.string "title"
    t.text "description", default: ""
    t.string "status", default: ""
    t.bigint "challenge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_bugs_on_challenge_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.string "name"
    t.text "description", default: ""
    t.string "duration", default: "--:--"
    t.integer "points", default: 0
    t.string "category", default: ""
    t.string "level", default: ""
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_challenges_on_project_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.text "description", default: ""
    t.string "location", default: ""
    t.string "contact_no", default: ""
    t.string "email", default: ""
    t.string "ceo", default: ""
    t.string "category", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_users_on_company_id"
    t.index ["user_id"], name: "index_company_users_on_user_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.text "description", default: ""
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_departments_on_company_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description", default: ""
    t.string "category", default: ""
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_projects_on_department_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "statement"
    t.string "option1"
    t.string "option2"
    t.string "option3"
    t.string "option4"
    t.string "correct_option"
    t.bigint "quiz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quiz_attempts", force: :cascade do |t|
    t.integer "earned_marks"
    t.string "status"
    t.integer "attempted_questions"
    t.integer "correct_answers"
    t.string "time_taken", default: "--:--"
    t.bigint "user_id"
    t.bigint "quiz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_quiz_attempts_on_quiz_id"
    t.index ["user_id"], name: "index_quiz_attempts_on_user_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "name"
    t.string "time_allowed", default: "--:--"
    t.integer "no_of_questions", default: 0
    t.integer "pass_score", default: 0
    t.bigint "project_id"
    t.bigint "quiz_attempt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_quizzes_on_project_id"
    t.index ["quiz_attempt_id"], name: "index_quizzes_on_quiz_attempt_id"
  end

  create_table "solutions", force: :cascade do |t|
    t.text "description", default: ""
    t.string "link", default: ""
    t.bigint "bug_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bug_id"], name: "index_solutions_on_bug_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
