class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.references :category, null: false, index: true
      t.references :subcategory, null: false, index: true

      # Company info
      t.string :name, null: false, limit: 150, index: true
      t.string :brand_identifier, null: false, limit: 60, index: { unique: true }
      # t.string :category, null: false, limit: 100
      t.integer :price_range, null: false, inclusion: 1..4
      t.date :founding_date, null: false
      t.string :mission, null: false, limit: 125
      t.text :about, null: false, limit: 6000
      t.text :story, null: false, limit: 6000

      # Contact info
      t.string :email, null: false, limit: 100
      t.string :phone, null: true, limit: 20
      t.string :address1, null: false, limit: 100
      t.string :address2, null: true, limit: 100
      t.string :city, null: false, limit: 100
      t.string :state_code, null: false, limit: 5
      t.string :country_code, null: false, limit: 5
      t.string :zipcode, null: false, limit: 15

      # Social media links
      t.text :homepage_link, null: true, limit: 500
      t.text :instagram_link, null: true, limit: 500
      t.text :youtube_link, null: true, limit: 500
      t.text :facebook_link, null: true, limit: 500
      t.text :twitter_link, null: true, limit: 500
      t.text :snapchat_link, null: true, limit: 500
      t.text :tiktok_link, null: true, limit: 500
      t.text :pinterest_link, null: true, limit: 500

      # FriendlyID slug
      t.string :slug, index: { unique: true }

      # Discarded gem
      t.datetime :discarded_at, index: true

      # Caching for acts_as_votable
      t.integer :cached_votes_total, default: 0
      t.integer :cached_votes_score, default: 0
      t.integer :cached_votes_up, default: 0
      t.integer :cached_votes_down, default: 0
      t.integer :cached_weighted_score, default: 0
      t.integer :cached_weighted_total, default: 0
      t.float :cached_weighted_average, default: 0.0

      # acts_as_favoritable (acts_as_favoritor gem)
      t.text :favoritable_score
      t.text :favoritable_total

      t.timestamps
    end
  end
end
