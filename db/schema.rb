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

ActiveRecord::Schema.define(version: 2022_01_13_150345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "users", force: :cascade do |t|
    t.string "email", null: false, comment: "User email and login"
    t.string "password_digest", null: false
    t.string "first_name", null: false
    t.string "second_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "user_email", unique: true
    t.index ["first_name"], name: "first_name"
  end

  add_foreign_key "articles", "categories", column: "categories_id"
  add_foreign_key "articles", "users", column: "users_id"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
end
