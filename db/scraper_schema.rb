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

ActiveRecord::Schema.define(version: 2020_09_16_162631) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "scraper_built_links", force: :cascade do |t|
    t.string "product_name", null: false
    t.string "product_url", null: false
    t.jsonb "link_attributes", default: {}, null: false
    t.string "brand_identifier", null: false
    t.string "body_part_name"
    t.string "category_name"
    t.string "subcategory_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.string "brand_identifier", null: false
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
    t.index ["discarded_at"], name: "index_scraper_products_on_discarded_at"
    t.index ["slug"], name: "index_scraper_products_on_slug", unique: true
  end

end
