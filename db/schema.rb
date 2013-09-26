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

ActiveRecord::Schema.define(version: 20130918141819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "completions", force: true do |t|
    t.integer  "task_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "completions", ["task_id"], name: "index_completions_on_task_id", using: :btree
  add_index "completions", ["user_id"], name: "index_completions_on_user_id", using: :btree

  create_table "courses", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["slug"], name: "index_courses_on_slug", unique: true, using: :btree

  create_table "enrollments", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "session_id"
  end

  add_index "enrollments", ["user_id", "session_id"], name: "index_enrollments_on_user_id_and_session_id", unique: true, using: :btree
  add_index "enrollments", ["user_id"], name: "index_enrollments_on_user_id", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.string   "image_url"
    t.text     "description"
    t.boolean  "private"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leaderships", force: true do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "leaderships", ["course_id"], name: "index_leaderships_on_course_id", using: :btree
  add_index "leaderships", ["user_id", "course_id"], name: "index_leaderships_on_user_id_and_course_id", unique: true, using: :btree
  add_index "leaderships", ["user_id"], name: "index_leaderships_on_user_id", using: :btree

  create_table "lessons", force: true do |t|
    t.integer  "session_id"
    t.text     "overview"
    t.datetime "date_available"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "number"
  end

  add_index "lessons", ["date_available"], name: "index_lessons_on_date_available", using: :btree
  add_index "lessons", ["number"], name: "index_lessons_on_number", unique: true, using: :btree
  add_index "lessons", ["session_id"], name: "index_lessons_on_session_id", using: :btree

  create_table "sessions", force: true do |t|
    t.integer  "course_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "sessions", ["course_id"], name: "index_sessions_on_course_id", using: :btree
  add_index "sessions", ["slug"], name: "index_sessions_on_slug", unique: true, using: :btree

  create_table "students", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students", ["course_id"], name: "index_students_on_course_id", using: :btree
  add_index "students", ["user_id"], name: "index_students_on_user_id", using: :btree

  create_table "tasks", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.text     "details"
    t.integer  "lesson_id"
    t.string   "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["lesson_id"], name: "index_tasks_on_lesson_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gravatar_id"
    t.string   "location"
    t.string   "nickname"
    t.string   "email"
    t.string   "slug"
    t.boolean  "admin"
  end

  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

end
