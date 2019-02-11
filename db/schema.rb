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

ActiveRecord::Schema.define(version: 2019_02_11_021102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "tags", default: [], array: true
    t.string "parent_url"
    t.datetime "published_at"
  end

  create_table "authentications", force: :cascade do |t|
    t.string "uid"
    t.string "token"
    t.string "provider"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "feeds", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "article_id"
    t.bigint "podcast_id"
    t.bigint "project_id"
    t.bigint "video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "week"
    t.index ["article_id"], name: "index_feeds_on_article_id"
    t.index ["podcast_id"], name: "index_feeds_on_podcast_id"
    t.index ["project_id"], name: "index_feeds_on_project_id"
    t.index ["user_id"], name: "index_feeds_on_user_id"
    t.index ["video_id"], name: "index_feeds_on_video_id"
  end

  create_table "podcasts", force: :cascade do |t|
    t.string "link"
    t.string "creator"
    t.text "tags", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.datetime "published_at"
    t.text "images"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "avatar"
    t.string "developer_type", default: [], array: true
    t.string "interest", default: [], array: true
    t.hstore "user_languages_skill", default: {"ruby"=>"beginner", "python"=>"beginner", "javascript"=>"beginner"}
    t.integer "roles", default: 0
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
    t.index ["user_languages_skill"], name: "index_users_on_user_languages_skill", using: :gist
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.string "channel"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "tags", default: [], array: true
  end

  add_foreign_key "authentications", "users"
  add_foreign_key "feeds", "articles"
  add_foreign_key "feeds", "podcasts"
  add_foreign_key "feeds", "projects"
  add_foreign_key "feeds", "users"
  add_foreign_key "feeds", "videos"
end
