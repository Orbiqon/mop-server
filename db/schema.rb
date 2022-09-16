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

ActiveRecord::Schema.define(version: 2022_09_15_084359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
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
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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

  create_table "artist_settings", force: :cascade do |t|
    t.bigint "user_id"
    t.string "payment_method"
    t.string "store_currency"
    t.string "order_delay"
    t.text "terms_of_service"
    t.text "digital_image_licence"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_artist_settings_on_user_id"
  end

  create_table "artwork_images", force: :cascade do |t|
    t.bigint "artwork_id"
    t.integer "orientation"
    t.integer "sequence"
    t.boolean "featured_image", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artwork_id"], name: "index_artwork_images_on_artwork_id"
  end

  create_table "artworks", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.text "notes"
    t.string "edition_type"
    t.integer "edition_quantity"
    t.boolean "sellable"
    t.integer "sell_via"
    t.boolean "exhibitionable"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "views", default: 0
    t.bigint "price_sheet_id"
    t.index ["price_sheet_id"], name: "index_artworks_on_price_sheet_id"
    t.index ["user_id"], name: "index_artworks_on_user_id"
  end

  create_table "artworks_colours", id: false, force: :cascade do |t|
    t.bigint "artwork_id", null: false
    t.bigint "colour_id", null: false
    t.index ["artwork_id", "colour_id"], name: "index_artworks_colours_on_artwork_id_and_colour_id"
    t.index ["colour_id", "artwork_id"], name: "index_artworks_colours_on_colour_id_and_artwork_id"
  end

  create_table "artworks_styles", id: false, force: :cascade do |t|
    t.bigint "artwork_id", null: false
    t.bigint "style_id", null: false
    t.index ["artwork_id", "style_id"], name: "index_artworks_styles_on_artwork_id_and_style_id"
    t.index ["style_id", "artwork_id"], name: "index_artworks_styles_on_style_id_and_artwork_id"
  end

  create_table "borders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "colours", force: :cascade do |t|
    t.string "name"
    t.boolean "status", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "continents", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.bigint "user_id"
    t.string "code", null: false
    t.string "description"
    t.date "valid_from"
    t.date "valid_until", null: false
    t.integer "redemption_limit", default: 1
    t.integer "coupon_redemptions_count", default: 0
    t.integer "amount", default: 0
    t.integer "amount_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_coupons_on_user_id"
  end

  create_table "exhibition_artworks", force: :cascade do |t|
    t.bigint "exhibition_id"
    t.bigint "artwork_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artwork_id"], name: "index_exhibition_artworks_on_artwork_id"
    t.index ["exhibition_id"], name: "index_exhibition_artworks_on_exhibition_id"
  end

  create_table "exhibition_styles", force: :cascade do |t|
    t.string "name"
    t.boolean "status", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.text "description"
  end

  create_table "exhibitions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "gallery_id"
    t.bigint "exhibition_style_id"
    t.string "room_name"
    t.string "artist_name"
    t.boolean "draft", default: false
    t.boolean "status", default: false
    t.string "key"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "views", default: 0
    t.index ["exhibition_style_id"], name: "index_exhibitions_on_exhibition_style_id"
    t.index ["gallery_id"], name: "index_exhibitions_on_gallery_id"
    t.index ["user_id"], name: "index_exhibitions_on_user_id"
  end

  create_table "faqs", force: :cascade do |t|
    t.text "question"
    t.text "answer"
    t.boolean "status"
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
    t.string "artist_name"
    t.integer "gallery_type"
    t.string "domain"
    t.string "welcome_video"
    t.integer "views", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_galleries_on_user_id"
  end

  create_table "insights", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mouldings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mounts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "artwork_id"
    t.string "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "price", precision: 10, scale: 2
    t.integer "user_id"
    t.string "size"
    t.string "paper"
    t.string "frame"
    t.string "mount_size"
    t.index ["artwork_id"], name: "index_order_items_on_artwork_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.text "address_1"
    t.text "address_2"
    t.text "address_3"
    t.string "postcode"
    t.string "country"
    t.text "shipping_address_1"
    t.text "shipping_address_2"
    t.text "shipping_address_3"
    t.text "shipping_postcode"
    t.text "shipping_country"
    t.string "total_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
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

  create_table "price_sheet_entries", force: :cascade do |t|
    t.bigint "price_sheet_id"
    t.integer "paper_one"
    t.integer "paper_two"
    t.integer "size"
    t.string "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["price_sheet_id"], name: "index_price_sheet_entries_on_price_sheet_id"
  end

  create_table "price_sheets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "surname"
    t.string "company_name"
    t.string "phone_number"
    t.text "bio"
    t.json "social_account"
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

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.boolean "status", default: false
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

  create_table "tax_rates", force: :cascade do |t|
    t.bigint "continent_id"
    t.string "country"
    t.string "rate"
    t.string "total_rate"
    t.string "on_shipping"
    t.string "on_digital"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["continent_id"], name: "index_tax_rates_on_continent_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "user_type"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "subscriptions", "packages"
  add_foreign_key "subscriptions", "users"
end
