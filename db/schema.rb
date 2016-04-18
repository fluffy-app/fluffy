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

ActiveRecord::Schema.define(version: 20160417171824) do

  create_table "chats", force: :cascade do |t|
    t.text     "comment",    limit: 65535
    t.integer  "thing_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "chats", ["thing_id"], name: "index_chats_on_thing_id", using: :btree
  add_index "chats", ["user_id"], name: "index_chats_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "detail",     limit: 65535
    t.date     "schedule"
    t.string   "place",      limit: 255
    t.boolean  "delete",     limit: 1
    t.boolean  "close",      limit: 1
    t.integer  "thing_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "events", ["thing_id"], name: "index_events_on_thing_id", using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.integer  "favorite_user_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "favorites", ["favorite_user_id"], name: "index_favorites_on_favorite_user_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "me_toos", force: :cascade do |t|
    t.integer  "passion",    limit: 4
    t.boolean  "accepted",   limit: 1
    t.boolean  "delete",     limit: 1
    t.integer  "thing_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "me_toos", ["thing_id"], name: "index_me_toos_on_thing_id", using: :btree
  add_index "me_toos", ["user_id"], name: "index_me_toos_on_user_id", using: :btree

  create_table "post_tags", force: :cascade do |t|
    t.integer  "post_id",    limit: 4
    t.integer  "tag_id",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "post_tags", ["post_id"], name: "index_post_tags_on_post_id", using: :btree
  add_index "post_tags", ["tag_id"], name: "index_post_tags_on_tag_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.text     "comment",    limit: 65535
    t.string   "image_path", limit: 255
    t.integer  "thing_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "posts", ["thing_id"], name: "index_posts_on_thing_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "thing_tags", force: :cascade do |t|
    t.integer  "thing_id",   limit: 4
    t.integer  "tag_id",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "thing_tags", ["tag_id"], name: "index_thing_tags_on_tag_id", using: :btree
  add_index "thing_tags", ["thing_id"], name: "index_thing_tags_on_thing_id", using: :btree

  create_table "things", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.integer  "passion",    limit: 4
    t.date     "schedule"
    t.boolean  "delete",     limit: 1
    t.string   "image_path", limit: 255
    t.boolean  "close",      limit: 1
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "things", ["user_id"], name: "index_things_on_user_id", using: :btree

  create_table "user_tags", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "tag_id",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_tags", ["tag_id"], name: "index_user_tags_on_tag_id", using: :btree
  add_index "user_tags", ["user_id"], name: "index_user_tags_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "email",            limit: 255
    t.string   "image_path",       limit: 255
    t.string   "background_image", limit: 255
    t.integer  "gender",           limit: 4
    t.integer  "age",              limit: 4
    t.string   "address",          limit: 255
    t.boolean  "delete_flag",      limit: 1
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_foreign_key "chats", "things"
  add_foreign_key "chats", "users"
  add_foreign_key "events", "things"
  add_foreign_key "events", "users"
  add_foreign_key "favorites", "users"
  add_foreign_key "me_toos", "things"
  add_foreign_key "me_toos", "users"
  add_foreign_key "post_tags", "posts"
  add_foreign_key "post_tags", "tags"
  add_foreign_key "posts", "things"
  add_foreign_key "thing_tags", "tags"
  add_foreign_key "thing_tags", "things"
  add_foreign_key "things", "users"
  add_foreign_key "user_tags", "tags"
  add_foreign_key "user_tags", "users"
end
