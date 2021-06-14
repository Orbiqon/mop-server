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

ActiveRecord::Schema.define(version: 2021_06_14_151336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "artwork_frames", force: :cascade do |t|
    t.bigint "artwork_id"
    t.bigint "frame_id"
    t.float "base_price", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artwork_id"], name: "index_artwork_frames_on_artwork_id"
    t.index ["frame_id"], name: "index_artwork_frames_on_frame_id"
  end

  create_table "artwork_papers", force: :cascade do |t|
    t.bigint "artwork_id"
    t.bigint "paper_id"
    t.float "base_price", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artwork_id"], name: "index_artwork_papers_on_artwork_id"
    t.index ["paper_id"], name: "index_artwork_papers_on_paper_id"
  end

  create_table "artwork_sizes", force: :cascade do |t|
    t.bigint "artwork_id"
    t.bigint "size_id"
    t.float "base_price", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artwork_id"], name: "index_artwork_sizes_on_artwork_id"
    t.index ["size_id"], name: "index_artwork_sizes_on_size_id"
  end

  create_table "artworks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "landspace", default: false
    t.boolean "sellable", default: false
    t.boolean "fullfil", default: false
    t.boolean "live", default: false
    t.boolean "exhibit", default: false
    t.float "base_price", default: 0.0
    t.integer "quantity", default: 0
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "artworks_categories", id: false, force: :cascade do |t|
    t.bigint "artwork_id", null: false
    t.bigint "category_id", null: false
    t.index ["artwork_id", "category_id"], name: "index_artworks_categories_on_artwork_id_and_category_id"
    t.index ["category_id", "artwork_id"], name: "index_artworks_categories_on_category_id_and_artwork_id"
  end

  create_table "artworks_rooms", id: false, force: :cascade do |t|
    t.bigint "room_id", null: false
    t.bigint "artwork_id", null: false
    t.index ["artwork_id", "room_id"], name: "index_artworks_rooms_on_artwork_id_and_room_id"
    t.index ["room_id", "artwork_id"], name: "index_artworks_rooms_on_room_id_and_artwork_id"
  end

  create_table "artworks_styles", id: false, force: :cascade do |t|
    t.bigint "artwork_id", null: false
    t.bigint "style_id", null: false
    t.index ["artwork_id", "style_id"], name: "index_artworks_styles_on_artwork_id_and_style_id"
    t.index ["style_id", "artwork_id"], name: "index_artworks_styles_on_style_id_and_artwork_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "frames", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "title"
    t.string "welcome_video"
    t.bigint "style_id"
    t.bigint "frame_id"
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "state"
    t.index ["frame_id"], name: "index_galleries_on_frame_id"
    t.index ["style_id"], name: "index_galleries_on_style_id"
    t.index ["user_id"], name: "index_galleries_on_user_id"
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.bigint "resource_owner_id", null: false
    t.bigint "application_id", null: false
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "scopes", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_grants_on_application_id"
    t.index ["resource_owner_id"], name: "index_oauth_access_grants_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.bigint "resource_owner_id"
    t.bigint "application_id"
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_tokens_on_application_id"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.boolean "confidential", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "enable"
    t.float "price"
    t.integer "duration_type"
    t.integer "duration_span"
    t.integer "trial", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "papers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "description"
    t.string "inspiration"
    t.integer "experience"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "profiles_styles", id: false, force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "style_id", null: false
    t.index ["profile_id", "style_id"], name: "index_profiles_styles_on_profile_id_and_style_id"
    t.index ["style_id", "profile_id"], name: "index_profiles_styles_on_style_id_and_profile_id"
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

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.bigint "gallery_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gallery_id"], name: "index_rooms_on_gallery_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "package_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean "status", default: false
    t.boolean "renew", default: false
    t.boolean "on_trial", default: false
    t.string "charge_id"
    t.string "job_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["package_id"], name: "index_subscriptions_on_package_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "stripe_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
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

  add_foreign_key "artwork_frames", "artworks"
  add_foreign_key "artwork_frames", "frames"
  add_foreign_key "artwork_papers", "artworks"
  add_foreign_key "artwork_papers", "papers"
  add_foreign_key "artwork_sizes", "artworks"
  add_foreign_key "artwork_sizes", "sizes"
  add_foreign_key "galleries", "frames"
  add_foreign_key "galleries", "styles"
  add_foreign_key "galleries", "users"
  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "profiles", "users"
  add_foreign_key "rooms", "galleries"
  add_foreign_key "subscriptions", "packages"
  add_foreign_key "subscriptions", "users"
end
