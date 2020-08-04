class CreateBrands < ActiveRecord::Migration[6.0]
  def change

    create_table :brands do |t|
      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true

      # Company info
      t.string :name, null: false, limit: 150, index: true
      t.string :alias, null: false, limit: 50, index: { unique: true }
      t.string :category, null: false, limit: 100
      t.integer :price_range, null: false, inclusion: 1..4
      t.date :founding_date, null: false
      t.string :mission, null: false, limit: 125
      t.text :about, null: false, limit: 6000
      t.text :story, null: false, limit: 6000

      ### SET TO null: false IN PRODUCTION ###
      t.jsonb :brand_logo_data

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

      t.string :slug, index: { unique: true }

      t.timestamps
    end

  end
end
