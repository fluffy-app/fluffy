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

ActiveRecord::Schema.define(version: 20160417230923) do

  create_table "chats", force: :cascade do |t|
    t.text     "comment"
    t.integer  "thing_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "chats", ["thing_id"], name: "index_chats_on_thing_id"
  add_index "chats", ["user_id"], name: "index_chats_on_user_id"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "detail"
    t.date     "schedule_date"
    t.string   "place"
    t.boolean  "delete_flag"
    t.boolean  "close_flag"
    t.integer  "thing_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "events", ["thing_id"], name: "index_events_on_thing_id"
  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "favorite_user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "favorites", ["favorite_user_id"], name: "index_favorites_on_favorite_user_id"
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id"

  create_table "me_toos", force: :cascade do |t|
    t.integer  "passion"
    t.boolean  "accepted_flag"
    t.boolean  "delete_flag"
    t.integer  "thing_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "me_toos", ["thing_id"], name: "index_me_toos_on_thing_id"
  add_index "me_toos", ["user_id"], name: "index_me_toos_on_user_id"

  create_table "post_tags", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "post_tags", ["post_id"], name: "index_post_tags_on_post_id"
  add_index "post_tags", ["tag_id"], name: "index_post_tags_on_tag_id"

  create_table "posts", force: :cascade do |t|
    t.text     "comment"
    t.string   "image_path"
    t.integer  "thing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "posts", ["thing_id"], name: "index_posts_on_thing_id"

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "thing_tags", force: :cascade do |t|
    t.integer  "thing_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "thing_tags", ["tag_id"], name: "index_thing_tags_on_tag_id"
  add_index "thing_tags", ["thing_id"], name: "index_thing_tags_on_thing_id"

  create_table "things", force: :cascade do |t|
    t.string   "title"
    t.integer  "passion"
    t.date     "schedule_date"
    t.boolean  "delete_flag"
    t.string   "image_path"
    t.boolean  "close_flag"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "things", ["user_id"], name: "index_things_on_user_id"

  create_table "user_tags", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_tags", ["tag_id"], name: "index_user_tags_on_tag_id"
  add_index "user_tags", ["user_id"], name: "index_user_tags_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "image_path"
    t.string   "background_image"
    t.integer  "gender"
    t.integer  "age"
    t.string   "address"
    t.boolean  "delete_flag"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
