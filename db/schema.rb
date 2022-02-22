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

ActiveRecord::Schema.define(version: 20220210112451112) do

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
    t.text "content", comment: "Article content"
    t.string "caption"
    t.boolean "show_comment", default: true
    t.boolean "is_public", default: true, comment: "Check if public"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "categories_id"
    t.bigint "users_id"
    t.bigint "teams_id"
    t.bigint "countries_id", comment: "Article location"
    t.string "aasm_state"
    t.index ["caption"], name: "index_articles_on_caption"
    t.index ["categories_id"], name: "index_articles_on_categories_id"
    t.index ["countries_id"], name: "index_articles_on_countries_id"
    t.index ["teams_id"], name: "index_articles_on_teams_id"
    t.index ["title"], name: "article_title", unique: true
    t.index ["users_id"], name: "index_articles_on_users_id"
  end

  create_table "banners", force: :cascade do |t|
    t.string "title"
    t.integer "status", limit: 2, default: 0
    t.bigint "publish_in_id"
    t.bigint "languages_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["languages_id"], name: "index_banners_on_languages_id"
    t.index ["publish_in_id"], name: "index_banners_on_publish_in_id"
    t.index ["title"], name: "index_banners_on_title"
  end

  create_table "banners_languages", id: false, force: :cascade do |t|
    t.bigint "banner_id", null: false
    t.bigint "language_id", null: false
    t.index ["banner_id", "language_id"], name: "index_banners_languages_on_banner_id_and_language_id"
    t.index ["language_id", "banner_id"], name: "index_banners_languages_on_language_id_and_banner_id"
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
    t.integer "liked", default: 0, comment: "Count of like"
    t.integer "disliked", default: 0, comment: "Count of dislike"
    t.boolean "edited", default: false, comment: "Was edit comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "article_id"
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "title", comment: "Country name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "index_countries_on_title"
  end

  create_table "footers", force: :cascade do |t|
    t.string "title"
    t.boolean "show", default: true, comment: "Hide/show"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "index_footers_on_title"
  end

  create_table "languages", force: :cascade do |t|
    t.string "title"
    t.boolean "status", comment: "Switch off/on"
    t.index ["title"], name: "index_languages_on_title"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "social_network_placements", force: :cascade do |t|
    t.string "title", comment: "Placement for social groups"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "social_networks", force: :cascade do |t|
    t.string "title", comment: "Name of socail network"
    t.string "api", comment: "For save api from social network"
    t.bigint "social_network_placements_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["social_network_placements_id"], name: "index_social_networks_on_social_network_placements_id"
  end

  create_table "survey_answers", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "survey_options_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["survey_options_id"], name: "index_survey_answers_on_survey_options_id"
    t.index ["users_id"], name: "index_survey_answers_on_users_id"
  end

  create_table "survey_options", force: :cascade do |t|
    t.string "answer", null: false
    t.bigint "surveys_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["surveys_id"], name: "index_survey_options_on_surveys_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "question", comment: "Main question"
    t.datetime "active_from", precision: 6, comment: "Date of start show survey"
    t.datetime "active_to", precision: 6, comment: "Date of end show surveys and change status to archived"
    t.integer "status", limit: 2, default: 0, comment: "Check if current survey is open or other sattus"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question"], name: "index_surveys_on_question"
  end

  create_table "teams", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "sub_category_id"
    t.bigint "categories_id"
    t.bigint "countries_id"
    t.bigint "author_id"
    t.index ["author_id"], name: "index_teams_on_author_id"
    t.index ["categories_id"], name: "index_teams_on_categories_id"
    t.index ["countries_id"], name: "index_teams_on_countries_id"
    t.index ["sub_category_id"], name: "index_teams_on_sub_category_id"
    t.index ["title"], name: "index_teams_on_title"
  end

  create_table "teams_users", id: false, force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "user_id", null: false
    t.index ["team_id", "user_id"], name: "index_teams_users_on_team_id_and_user_id"
    t.index ["user_id", "team_id"], name: "index_teams_users_on_user_id_and_team_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false, comment: "User email and login"
    t.string "password_digest", null: false
    t.string "first_name", null: false
    t.string "second_name"
    t.datetime "confirmed_at", precision: 6, comment: "Confirmation date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "reset_password_sent_at", precision: 6
    t.index ["email"], name: "user_email", unique: true
    t.index ["first_name"], name: "first_name"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "articles", "categories", column: "categories_id"
  add_foreign_key "articles", "countries", column: "countries_id"
  add_foreign_key "articles", "teams", column: "teams_id"
  add_foreign_key "articles", "users", column: "users_id"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
  add_foreign_key "social_networks", "social_network_placements", column: "social_network_placements_id"
  add_foreign_key "survey_options", "surveys", column: "surveys_id"
  add_foreign_key "teams", "categories", column: "categories_id"
  add_foreign_key "teams", "categories", column: "sub_category_id"
  add_foreign_key "teams", "countries", column: "countries_id"
  add_foreign_key "teams", "users", column: "author_id"
end
