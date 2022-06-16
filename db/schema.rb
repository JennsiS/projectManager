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

ActiveRecord::Schema[7.0].define(version: 2022_06_14_151225) do
  create_table "important_dates", force: :cascade do |t|
    t.date "date"
    t.string "description"
    t.string "name"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_important_dates_on_project_id"
  end

  create_table "phases", force: :cascade do |t|
    t.date "start_date"
    t.date "finish_date"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.date "start_date"
    t.date "finish_date"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "progress", null: false
  end

  create_table "projects_phases", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "phase_id", null: false
    t.integer "project_id", null: false
    t.string "role_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phase_id"], name: "index_projects_phases_on_phase_id"
    t.index ["project_id"], name: "index_projects_phases_on_project_id"
    t.index ["user_id"], name: "index_projects_phases_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_projects", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "project_id", null: false
    t.string "rol_project_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_users_projects_on_project_id"
    t.index ["user_id"], name: "index_users_projects_on_user_id"
  end

  create_table "users_roles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "projects_phases", "phases"
  add_foreign_key "projects_phases", "projects"
  add_foreign_key "projects_phases", "users"
  add_foreign_key "users_projects", "projects"
  add_foreign_key "users_projects", "users"
  add_foreign_key "users_roles", "roles"
  add_foreign_key "users_roles", "users"
end
