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

ActiveRecord::Schema.define(version: 2020_06_28_060500) do

  create_table "friends", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.boolean "active_status", null: false
    t.boolean "send_request", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_friends_on_recipient_id"
    t.index ["sender_id", "recipient_id"], name: "index_friends_on_sender_id_and_recipient_id", unique: true
    t.index ["sender_id"], name: "index_friends_on_sender_id"
  end

  create_table "genres", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_genres_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "visitor_id"
    t.integer "receiver_id"
    t.integer "plan_timing_id"
    t.integer "term_num"
    t.string "action", default: "", null: false
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_notifications_on_receiver_id"
    t.index ["visitor_id"], name: "index_notifications_on_visitor_id"
  end

  create_table "plan_timings", force: :cascade do |t|
    t.integer "post_id", null: false
    t.datetime "first_term"
    t.datetime "second_term"
    t.datetime "third_term"
    t.datetime "forth_term"
    t.datetime "first_min"
    t.datetime "first_max"
    t.datetime "second_min"
    t.datetime "second_max"
    t.datetime "third_min"
    t.datetime "third_max"
    t.datetime "forth_min"
    t.datetime "forth_max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_plan_timings_on_post_id"
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
    t.index ["genre_id"], name: "index_posts_on_genre_id"
    t.index ["relearn_count"], name: "index_posts_on_relearn_count"
    t.index ["title"], name: "index_posts_on_title"
    t.index ["total_point"], name: "index_posts_on_total_point"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.string "word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade do |t|
    t.integer "user_id", null: false
    t.float "total_rate", default: 0.0, null: false
    t.integer "count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_rates_on_user_id"
  end

  create_table "real_timings", force: :cascade do |t|
    t.integer "post_id", null: false
    t.datetime "first_term"
    t.datetime "second_term"
    t.datetime "third_term"
    t.datetime "forth_term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_real_timings_on_post_id"
  end

  create_table "relearn_points", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "first_score", default: 0, null: false
    t.integer "second_score", default: 0, null: false
    t.integer "third_score", default: 0, null: false
    t.integer "forth_score", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_relearn_points_on_post_id"
  end

  create_table "total_points", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "score", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_total_points_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "image_id"
    t.boolean "email_status", default: true, null: false
    t.boolean "rank_status", default: false, null: false
    t.boolean "search_status", default: false, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "provider"
    t.string "uid"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email", "deleted_at"], name: "index_users_on_email_and_deleted_at", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "withdrawal_comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
