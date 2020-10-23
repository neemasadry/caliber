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

ActiveRecord::Schema.define(version: 2020_10_14_151730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pete_and_pedro_built_links", force: :cascade do |t|
    t.string "product_name", null: false
    t.string "product_url", null: false
    t.jsonb "link_attributes", default: {}, null: false
    t.bigint "scraper_brand_id", null: false
    t.string "body_part"
    t.string "category"
    t.string "subcategory"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["scraper_brand_id"], name: "index_pete_and_pedro_built_links_on_scraper_brand_id"
  end

  create_table "pete_and_pedro_products", force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.text "description", null: false
    t.decimal "retail_price", precision: 10, scale: 2, null: false
    t.integer "gender", null: false
    t.string "type_of", limit: 50, null: false
    t.text "product_url"
    t.jsonb "fragrance_attributes", default: {}, null: false
    t.jsonb "clothing_attributes", default: {}, null: false
    t.jsonb "cosmetic_attributes", default: {}, null: false
    t.jsonb "product_attributes", default: {}, null: false
    t.string "username", null: false
    t.string "account_name", null: false
    t.bigint "scraper_brand_id", null: false
    t.string "body_part"
    t.string "category"
    t.string "subcategory"
    t.string "slug"
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discarded_at"], name: "index_pete_and_pedro_products_on_discarded_at"
    t.index ["scraper_brand_id"], name: "index_pete_and_pedro_products_on_scraper_brand_id"
    t.index ["slug"], name: "index_pete_and_pedro_products_on_slug", unique: true
  end

  create_table "scraper_brands", force: :cascade do |t|
    t.string "user_id", limit: 150, null: false
    t.string "account_id", limit: 150, null: false
    t.string "name", limit: 150, null: false
    t.string "brand_identifier", limit: 60, null: false
    t.integer "price_range", null: false
    t.date "founding_date", null: false
    t.string "mission", limit: 125, null: false
    t.text "about", null: false
    t.text "story", null: false
    t.boolean "claimed", default: false, null: false
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_scraper_brands_on_account_id"
    t.index ["brand_identifier"], name: "index_scraper_brands_on_brand_identifier", unique: true
    t.index ["discarded_at"], name: "index_scraper_brands_on_discarded_at"
    t.index ["name"], name: "index_scraper_brands_on_name"
    t.index ["slug"], name: "index_scraper_brands_on_slug", unique: true
    t.index ["user_id"], name: "index_scraper_brands_on_user_id"
  end

  create_table "scraper_built_links", force: :cascade do |t|
    t.string "product_name", null: false
    t.string "product_url", null: false
    t.jsonb "link_attributes", default: {}, null: false
    t.bigint "scraper_brand_id", null: false
    t.string "body_part"
    t.string "category"
    t.string "subcategory"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["scraper_brand_id"], name: "index_scraper_built_links_on_scraper_brand_id"
  end

  create_table "scraper_products", force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.text "description", null: false
    t.decimal "retail_price", precision: 10, scale: 2, null: false
    t.integer "gender", null: false
    t.string "type_of", limit: 50, null: false
    t.text "product_url"
    t.jsonb "fragrance_attributes", default: {}, null: false
    t.jsonb "clothing_attributes", default: {}, null: false
    t.jsonb "cosmetic_attributes", default: {}, null: false
    t.string "username", null: false
    t.string "account_name", null: false
    t.bigint "scraper_brand_id", null: false
    t.string "slug"
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discarded_at"], name: "index_scraper_products_on_discarded_at"
    t.index ["scraper_brand_id"], name: "index_scraper_products_on_scraper_brand_id"
    t.index ["slug"], name: "index_scraper_products_on_slug", unique: true
  end

  add_foreign_key "pete_and_pedro_built_links", "scraper_brands"
  add_foreign_key "pete_and_pedro_products", "scraper_brands"
  add_foreign_key "scraper_built_links", "scraper_brands"
  add_foreign_key "scraper_products", "scraper_brands"
end
