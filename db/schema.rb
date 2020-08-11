# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_10_170921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessories", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "brand_id", null: false
    t.string "name", limit: 100, null: false
    t.text "description", null: false
    t.decimal "retail_price", precision: 10, scale: 2, null: false
    t.string "type_of", limit: 80, null: false
    t.string "gender", limit: 6, null: false
    t.text "materials"
    t.string "primary_color", limit: 30, null: false
    t.string "secondary_color", limit: 30
    t.text "product_url"
    t.string "slug"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.text "favoritable_score"
    t.text "favoritable_total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_accessories_on_brand_id"
    t.index ["slug"], name: "index_accessories_on_slug", unique: true
    t.index ["user_id"], name: "index_accessories_on_user_id"
  end

  create_table "account_invitations", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "invited_by_id"
    t.string "token"
    t.string "name"
    t.string "email"
    t.jsonb "roles", default: {}, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_account_invitations_on_account_id"
    t.index ["invited_by_id"], name: "index_account_invitations_on_invited_by_id"
    t.index ["token"], name: "index_account_invitations_on_token", unique: true
  end

  create_table "account_users", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "user_id"
    t.jsonb "roles", default: {}, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_account_users_on_account_id"
    t.index ["user_id"], name: "index_account_users_on_user_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.bigint "owner_id"
    t.boolean "personal", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "processor"
    t.string "processor_id"
    t.datetime "trial_ends_at"
    t.string "card_type"
    t.string "card_last4"
    t.string "card_exp_month"
    t.string "card_exp_year"
    t.text "extra_billing_info"
    t.string "domain"
    t.string "subdomain"
    t.index ["owner_id"], name: "index_accounts_on_owner_id"
  end

  create_table "action_text_embeds", force: :cascade do |t|
    t.string "url"
    t.jsonb "fields"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "announcements", force: :cascade do |t|
    t.string "kind"
    t.string "title"
    t.datetime "published_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "api_tokens", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "token"
    t.string "name"
    t.jsonb "metadata", default: {}
    t.boolean "transient", default: false
    t.datetime "last_used_at"
    t.datetime "expires_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["token"], name: "index_api_tokens_on_token", unique: true
    t.index ["user_id"], name: "index_api_tokens_on_user_id"
  end

  create_table "bottoms", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "brand_id", null: false
    t.string "name", limit: 100, null: false
    t.text "description", null: false
    t.decimal "retail_price", precision: 10, scale: 2, null: false
    t.string "type_of", limit: 80, null: false
    t.string "gender", limit: 6, null: false
    t.text "materials"
    t.string "primary_color", limit: 30, null: false
    t.string "secondary_color", limit: 30
    t.text "product_url"
    t.string "slug"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.text "favoritable_score"
    t.text "favoritable_total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_bottoms_on_brand_id"
    t.index ["slug"], name: "index_bottoms_on_slug", unique: true
    t.index ["user_id"], name: "index_bottoms_on_user_id"
  end

  create_table "brands", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "account_id", null: false
    t.string "name", limit: 150, null: false
    t.string "alias", limit: 50, null: false
    t.string "category", limit: 100, null: false
    t.integer "price_range", null: false
    t.date "founding_date", null: false
    t.string "mission", limit: 125, null: false
    t.text "about", null: false
    t.text "story", null: false
    t.jsonb "brand_logo_data"
    t.string "email", limit: 100, null: false
    t.string "phone", limit: 20
    t.string "address1", limit: 100, null: false
    t.string "address2", limit: 100
    t.string "city", limit: 100, null: false
    t.string "state_code", limit: 5, null: false
    t.string "country_code", limit: 5, null: false
    t.string "zipcode", limit: 15, null: false
    t.text "homepage_link"
    t.text "instagram_link"
    t.text "youtube_link"
    t.text "facebook_link"
    t.text "twitter_link"
    t.text "snapchat_link"
    t.text "tiktok_link"
    t.text "pinterest_link"
    t.string "slug"
    t.datetime "discarded_at"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.text "favoritable_score"
    t.text "favoritable_total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_brands_on_account_id"
    t.index ["alias"], name: "index_brands_on_alias", unique: true
    t.index ["discarded_at"], name: "index_brands_on_discarded_at"
    t.index ["name"], name: "index_brands_on_name"
    t.index ["slug"], name: "index_brands_on_slug", unique: true
    t.index ["user_id"], name: "index_brands_on_user_id"
  end

  create_table "collection_items", force: :cascade do |t|
    t.string "collectable_item_type", null: false
    t.bigint "collectable_item_id", null: false
    t.bigint "collection_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collectable_item_type", "collectable_item_id"], name: "index_collection_items_on_collectable_type_and_id"
    t.index ["collection_id"], name: "index_collection_items_on_collection_id"
  end

  create_table "collections", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "collection_type", limit: 30, null: false
    t.integer "total_items", default: 0, null: false
    t.decimal "total_price", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "discarded_at"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.text "favoritable_score"
    t.text "favoritable_total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discarded_at"], name: "index_collections_on_discarded_at"
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "commentable_type", null: false
    t.integer "commentable_id", null: false
    t.integer "parent_id", default: 0, null: false
    t.bigint "user_id", null: false
    t.bigint "account_id", null: false
    t.bigint "brand_id"
    t.text "body", null: false
    t.boolean "deleted", default: false, null: false
    t.datetime "discarded_at"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_comments_on_account_id"
    t.index ["brand_id"], name: "index_comments_on_brand_id"
    t.index ["commentable_id"], name: "index_comments_on_commentable_id"
    t.index ["commentable_type"], name: "index_comments_on_commentable_type"
    t.index ["discarded_at"], name: "index_comments_on_discarded_at"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "cosmetics", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "brand_id", null: false
    t.string "name", limit: 100, null: false
    t.text "description", null: false
    t.decimal "retail_price", precision: 10, scale: 2, null: false
    t.string "type_of", limit: 80, null: false
    t.string "gender", limit: 6, null: false
    t.text "ingredients"
    t.text "product_url"
    t.string "slug"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.text "favoritable_score"
    t.text "favoritable_total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_cosmetics_on_brand_id"
    t.index ["slug"], name: "index_cosmetics_on_slug", unique: true
    t.index ["user_id"], name: "index_cosmetics_on_user_id"
  end

  create_table "dresses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "brand_id", null: false
    t.string "name", limit: 100, null: false
    t.text "description", null: false
    t.decimal "retail_price", precision: 10, scale: 2, null: false
    t.string "type_of", limit: 80, null: false
    t.string "gender", limit: 6, null: false
    t.text "materials"
    t.string "primary_color", limit: 30, null: false
    t.string "secondary_color", limit: 30
    t.text "product_url"
    t.string "slug"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.text "favoritable_score"
    t.text "favoritable_total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_dresses_on_brand_id"
    t.index ["slug"], name: "index_dresses_on_slug", unique: true
    t.index ["user_id"], name: "index_dresses_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.string "favoritable_type", null: false
    t.bigint "favoritable_id", null: false
    t.string "favoritor_type", null: false
    t.bigint "favoritor_id", null: false
    t.string "scope", default: "favorite", null: false
    t.boolean "blocked", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blocked"], name: "index_favorites_on_blocked"
    t.index ["favoritable_id", "favoritable_type"], name: "fk_favoritables"
    t.index ["favoritable_type", "favoritable_id"], name: "index_favorites_on_favoritable_type_and_favoritable_id"
    t.index ["favoritor_id", "favoritor_type"], name: "fk_favorites"
    t.index ["favoritor_type", "favoritor_id"], name: "index_favorites_on_favoritor_type_and_favoritor_id"
    t.index ["scope"], name: "index_favorites_on_scope"
  end

  create_table "fragrances", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "brand_id", null: false
    t.string "name", limit: 100, null: false
    t.text "description", null: false
    t.decimal "retail_price", precision: 10, scale: 2, null: false
    t.date "release_date"
    t.string "type_of", limit: 80, null: false
    t.string "gender", limit: 6, null: false
    t.text "ingredients"
    t.string "top_notes", limit: 150
    t.string "middle_notes", limit: 150
    t.string "base_notes", limit: 150
    t.string "accords", limit: 150
    t.text "product_url"
    t.string "slug"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.text "favoritable_score"
    t.text "favoritable_total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_fragrances_on_brand_id"
    t.index ["slug"], name: "index_fragrances_on_slug", unique: true
    t.index ["user_id"], name: "index_fragrances_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "guides", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "account_id", null: false
    t.bigint "brand_id"
    t.string "title", limit: 80, null: false
    t.string "category", limit: 30, null: false
    t.string "subcategory_one", limit: 30
    t.string "subcategory_two", limit: 30
    t.text "guide_image_data"
    t.string "slug"
    t.datetime "discarded_at"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.text "favoritable_score"
    t.text "favoritable_total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_guides_on_account_id"
    t.index ["brand_id"], name: "index_guides_on_brand_id"
    t.index ["discarded_at"], name: "index_guides_on_discarded_at"
    t.index ["slug"], name: "index_guides_on_slug", unique: true
    t.index ["user_id"], name: "index_guides_on_user_id"
  end

  create_table "jewelries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "brand_id", null: false
    t.string "name", limit: 100, null: false
    t.text "description", null: false
    t.decimal "retail_price", precision: 10, scale: 2, null: false
    t.string "type_of", limit: 80, null: false
    t.string "gender", limit: 6, null: false
    t.text "materials"
    t.string "primary_color", limit: 30, null: false
    t.string "secondary_color", limit: 30
    t.text "product_url"
    t.string "slug"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.text "favoritable_score"
    t.text "favoritable_total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_jewelries_on_brand_id"
    t.index ["slug"], name: "index_jewelries_on_slug", unique: true
    t.index ["user_id"], name: "index_jewelries_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "recipient_type", null: false
    t.bigint "recipient_id", null: false
    t.string "type"
    t.jsonb "params"
    t.datetime "read_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_notifications_on_account_id"
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient_type_and_recipient_id"
  end

  create_table "pay_charges", force: :cascade do |t|
    t.bigint "owner_id"
    t.string "processor", null: false
    t.string "processor_id", null: false
    t.integer "amount", null: false
    t.integer "amount_refunded"
    t.string "card_type"
    t.string "card_last4"
    t.string "card_exp_month"
    t.string "card_exp_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "owner_type"
    t.index ["owner_id"], name: "index_pay_charges_on_owner_id"
  end

  create_table "pay_subscriptions", id: :serial, force: :cascade do |t|
    t.integer "owner_id"
    t.string "name", null: false
    t.string "processor", null: false
    t.string "processor_id", null: false
    t.string "processor_plan", null: false
    t.integer "quantity", default: 1, null: false
    t.datetime "trial_ends_at"
    t.datetime "ends_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "status"
    t.string "owner_type"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.integer "amount", default: 0, null: false
    t.string "interval"
    t.jsonb "details", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trial_period_days", default: 0
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "account_id", null: false
    t.bigint "brand_id"
    t.string "content", limit: 240, null: false
    t.text "post_image_data"
    t.text "post_video_data"
    t.datetime "discarded_at"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.text "favoritable_score"
    t.text "favoritable_total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_posts_on_account_id"
    t.index ["brand_id"], name: "index_posts_on_brand_id"
    t.index ["discarded_at"], name: "index_posts_on_discarded_at"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "product_images", force: :cascade do |t|
    t.string "product_imageable_type", null: false
    t.bigint "product_imageable_id", null: false
    t.bigint "user_id", null: false
    t.bigint "brand_id", null: false
    t.text "product_image_data", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_product_images_on_brand_id"
    t.index ["product_imageable_type", "product_imageable_id"], name: "index_for_product_imageable"
    t.index ["user_id"], name: "index_product_images_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "reviewable_type", null: false
    t.bigint "reviewable_id", null: false
    t.bigint "user_id", null: false
    t.string "title", limit: 100, null: false
    t.integer "quality", default: 0, null: false
    t.integer "value", default: 0, null: false
    t.integer "compliment", default: 0, null: false
    t.jsonb "ratings", null: false
    t.string "slug"
    t.datetime "discarded_at"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.text "favoritable_score"
    t.text "favoritable_total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discarded_at"], name: "index_reviews_on_discarded_at"
    t.index ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable_type_and_reviewable_id"
    t.index ["slug"], name: "index_reviews_on_slug", unique: true
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "shoes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "brand_id", null: false
    t.string "name", limit: 100, null: false
    t.text "description", null: false
    t.decimal "retail_price", precision: 10, scale: 2, null: false
    t.string "type_of", limit: 80, null: false
    t.string "gender", limit: 6, null: false
    t.text "materials"
    t.string "primary_color", limit: 30, null: false
    t.string "secondary_color", limit: 30
    t.text "product_url"
    t.string "slug"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.text "favoritable_score"
    t.text "favoritable_total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_shoes_on_brand_id"
    t.index ["slug"], name: "index_shoes_on_slug", unique: true
    t.index ["user_id"], name: "index_shoes_on_user_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "tops", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "brand_id", null: false
    t.string "name", limit: 100, null: false
    t.text "description", null: false
    t.decimal "retail_price", precision: 10, scale: 2, null: false
    t.string "type_of", limit: 80, null: false
    t.string "gender", limit: 6, null: false
    t.text "materials"
    t.string "primary_color", limit: 30, null: false
    t.string "secondary_color", limit: 30
    t.text "product_url"
    t.string "slug"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.text "favoritable_score"
    t.text "favoritable_total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_tops_on_brand_id"
    t.index ["slug"], name: "index_tops_on_slug", unique: true
    t.index ["user_id"], name: "index_tops_on_user_id"
  end

  create_table "user_connected_accounts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "provider"
    t.string "uid"
    t.string "encrypted_access_token"
    t.string "encrypted_access_token_iv"
    t.string "encrypted_access_token_secret"
    t.string "encrypted_access_token_secret_iv"
    t.string "refresh_token"
    t.datetime "expires_at"
    t.text "auth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["encrypted_access_token_iv"], name: "index_connected_accounts_access_token_iv", unique: true
    t.index ["encrypted_access_token_secret_iv"], name: "index_connected_accounts_access_token_secret_iv", unique: true
    t.index ["user_id"], name: "index_user_connected_accounts_on_user_id"
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
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "time_zone", null: false
    t.datetime "accepted_terms_at"
    t.datetime "accepted_privacy_at"
    t.datetime "announcements_read_at"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.string "preferred_language"
    t.string "username", null: false
    t.text "avatar_image_data"
    t.date "date_of_birth", null: false
    t.string "gender", null: false
    t.string "country_code", null: false
    t.boolean "moderator", default: false
    t.text "favoritor_score"
    t.text "favoritor_total"
    t.text "favoritable_score"
    t.text "favoritable_total"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.string "slug"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.text "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "votes", force: :cascade do |t|
    t.string "votable_type"
    t.bigint "votable_id"
    t.string "voter_type"
    t.bigint "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["votable_type", "votable_id"], name: "index_votes_on_votable_type_and_votable_id"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
    t.index ["voter_type", "voter_id"], name: "index_votes_on_voter_type_and_voter_id"
  end

  add_foreign_key "accessories", "brands"
  add_foreign_key "accessories", "users"
  add_foreign_key "account_invitations", "accounts"
  add_foreign_key "account_invitations", "users", column: "invited_by_id"
  add_foreign_key "account_users", "accounts"
  add_foreign_key "account_users", "users"
  add_foreign_key "accounts", "users", column: "owner_id"
  add_foreign_key "api_tokens", "users"
  add_foreign_key "bottoms", "brands"
  add_foreign_key "bottoms", "users"
  add_foreign_key "brands", "accounts"
  add_foreign_key "brands", "users"
  add_foreign_key "collection_items", "collections"
  add_foreign_key "collections", "users"
  add_foreign_key "comments", "accounts"
  add_foreign_key "comments", "brands"
  add_foreign_key "comments", "users"
  add_foreign_key "cosmetics", "brands"
  add_foreign_key "cosmetics", "users"
  add_foreign_key "dresses", "brands"
  add_foreign_key "dresses", "users"
  add_foreign_key "fragrances", "brands"
  add_foreign_key "fragrances", "users"
  add_foreign_key "guides", "accounts"
  add_foreign_key "guides", "brands"
  add_foreign_key "guides", "users"
  add_foreign_key "jewelries", "brands"
  add_foreign_key "jewelries", "users"
  add_foreign_key "posts", "accounts"
  add_foreign_key "posts", "brands"
  add_foreign_key "posts", "users"
  add_foreign_key "product_images", "brands"
  add_foreign_key "product_images", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "shoes", "brands"
  add_foreign_key "shoes", "users"
  add_foreign_key "taggings", "tags"
  add_foreign_key "tops", "brands"
  add_foreign_key "tops", "users"
  add_foreign_key "user_connected_accounts", "users"
end
