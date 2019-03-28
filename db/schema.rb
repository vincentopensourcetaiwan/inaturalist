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

ActiveRecord::Schema.define(version: 2019_03_28_092220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "chinese_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "observations", force: :cascade do |t|
    t.integer "inaturalist_id"
    t.string "uri"
    t.string "photo_url"
    t.string "taxon_name"
    t.text "description"
    t.string "user_name"
    t.string "user_login"
    t.string "user_icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "longitude"
    t.float "latitude"
    t.string "wikipedia_url"
    t.string "chinese_taxon_name"
    t.integer "user_id"
    t.integer "category_id"
    t.string "category_name"
    t.datetime "observed_at"
    t.string "name"
  end

  create_table "periodings", force: :cascade do |t|
    t.bigint "period_id"
    t.bigint "observation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["observation_id"], name: "index_periodings_on_observation_id"
    t.index ["period_id"], name: "index_periodings_on_period_id"
  end

  create_table "periods", force: :cascade do |t|
    t.string "name"
    t.integer "start_year"
    t.integer "start_month"
    t.integer "start_day"
    t.integer "end_year"
    t.integer "end_month"
    t.integer "end_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "search_name"
  end

  create_table "photos", force: :cascade do |t|
    t.string "url"
    t.bigint "observation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["observation_id"], name: "index_photos_on_observation_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "chinese_name"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "placings", force: :cascade do |t|
    t.bigint "place_id"
    t.bigint "observation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["observation_id"], name: "index_placings_on_observation_id"
    t.index ["place_id"], name: "index_placings_on_place_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "observation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["observation_id"], name: "index_taggings_on_observation_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "role"
    t.integer "inaturalist_id"
    t.string "nickname"
    t.string "inaturalist_icon_url"
    t.string "inaturalist_login"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "periodings", "observations"
  add_foreign_key "periodings", "periods"
  add_foreign_key "photos", "observations"
  add_foreign_key "placings", "observations"
  add_foreign_key "placings", "places"
  add_foreign_key "taggings", "observations"
  add_foreign_key "taggings", "tags"
end
