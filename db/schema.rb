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

ActiveRecord::Schema.define(version: 2020_03_21_005236) do

  create_table "checks", force: :cascade do |t|
    t.integer "post_id", null: false
    t.boolean "first_check", default: false, null: false
    t.boolean "second_check", default: false, null: false
    t.boolean "third_check", default: false, null: false
    t.boolean "forth_check", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delete_comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friends", force: :cascade do |t|
    t.integer "sender_id", null: false
    t.integer "recipient_id", null: false
    t.boolean "active_status", null: false
    t.boolean "send_request", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "visitor_id", null: false
    t.integer "visited_id", null: false
    t.integer "post_id"
    t.integer "plan_timing_id"
    t.string "action", default: "", null: false
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plan_timings", force: :cascade do |t|
    t.integer "post_id", null: false
    t.datetime "first_term", null: false
    t.datetime "second_term", null: false
    t.datetime "third_term", null: false
    t.datetime "forth_term", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "genre_id", null: false
    t.string "title", null: false
    t.text "content"
    t.string "link"
    t.integer "relearn_count", default: 0
    t.boolean "relearn_complete", default: false
    t.integer "total_point", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["total_point"], name: "index_posts_on_total_point"
  end

  create_table "quotes", force: :cascade do |t|
    t.string "word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "relearn_average", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "real_timings", force: :cascade do |t|
    t.integer "post_id", null: false
    t.datetime "first_term"
    t.datetime "second_term"
    t.datetime "third_term"
    t.datetime "forth_term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relearn_points", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "first_score", default: 0, null: false
    t.integer "second_score", default: 0, null: false
    t.integer "third_score", default: 0, null: false
    t.integer "forth_score", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "total_points", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "score", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
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

end
