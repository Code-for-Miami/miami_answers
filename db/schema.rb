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

ActiveRecord::Schema.define(version: 20140715180713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "articles", force: true do |t|
    t.datetime "updated"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content_type"
    t.text     "preview"
    t.text     "tags"
    t.string   "slug"
    t.integer  "category_id"
    t.integer  "access_count",    default: 0
    t.string   "author_name"
    t.string   "author_link"
    t.string   "type"
    t.boolean  "render_markdown", default: true
    t.text     "content_main"
    t.string   "status",          default: "Draft"
    t.string   "title_es"
    t.text     "preview_es"
    t.text     "content_main_es"
    t.string   "title_cn"
    t.text     "preview_cn"
    t.text     "content_main_cn"
    t.integer  "user_id"
  end

  add_index "articles", ["slug"], name: "index_articles_on_slug", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "access_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "article_id"
    t.text     "description"
    t.string   "slug"
    t.integer  "user_id"
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true, using: :btree

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "subname"
    t.string   "number"
    t.string   "url"
    t.string   "address"
    t.string   "department"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.string   "name"
    t.string   "acronym"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", unique: true, using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "guide_steps", force: true do |t|
    t.integer  "article_id"
    t.string   "title"
    t.text     "content"
    t.text     "preview"
    t.integer  "step"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keywords", force: true do |t|
    t.string   "name"
    t.string   "metaphone"
    t.string   "stem"
    t.text     "synonyms"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wordcounts", force: true do |t|
    t.integer  "article_id"
    t.integer  "keyword_id"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
