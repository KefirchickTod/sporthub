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

ActiveRecord::Schema.define(version: 2022_02_09_122129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: 6, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "full_text", comment: "Main content of articles"
    t.string "short_text", comment: "Short content of articles"
    t.string "default_photo", comment: "Main photo in site and seo output"
    t.integer "is_public", limit: 2, default: 1, comment: "Check if public"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "categories_id"
    t.bigint "users_id"
    t.index ["categories_id"], name: "index_articles_on_categories_id"
    t.index ["title"], name: "article_title", unique: true
    t.index ["users_id"], name: "index_articles_on_users_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false, comment: "Main title of category"
    t.integer "parent_id", comment: "Parent id of category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "categories_title", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text "text", null: false, comment: "Comment content"
    t.integer "parent_id", comment: "Is comment sub?"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "article_id"
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "location"
    t.bigint "categories_id"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_teams_on_author_id"
    t.index ["categories_id"], name: "index_teams_on_categories_id"
    t.index ["title"], name: "index_teams_on_title"
  end

  create_table "user_teams", force: :cascade do |t|
    t.bigint "teams_id"
    t.bigint "users_id"
    t.index ["teams_id"], name: "index_user_teams_on_teams_id"
    t.index ["users_id"], name: "index_user_teams_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false, comment: "User email and login"
    t.string "password_digest", null: false
    t.string "first_name", null: false
    t.string "second_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "confirmed_at", precision: 6
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.integer "role", default: 0
    t.index ["email"], name: "user_email", unique: true
    t.index ["first_name"], name: "first_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "articles", "categories", column: "categories_id"
  add_foreign_key "articles", "users", column: "users_id"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
  add_foreign_key "teams", "categories", column: "categories_id"
  add_foreign_key "teams", "users", column: "author_id"
  add_foreign_key "user_teams", "teams", column: "teams_id"
  add_foreign_key "user_teams", "users", column: "users_id"
end
