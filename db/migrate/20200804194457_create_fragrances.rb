class CreateFragrances < ActiveRecord::Migration[6.0]
  def change
    create_table :fragrances do |t|
      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
      t.references :category, null: false, index: true
      t.references :subcategory, null: false, index: true

      t.string  :name, null: false, limit: 100
      t.text    :description, null: false, limit: 3000
      t.decimal :retail_price, null: false, precision: 10, scale: 2
      t.date    :release_date
      # t.string  :type_of, null: false, limit: 80
      t.string  :gender, null: false, limit: 6
      t.text    :ingredients, null: true, limit: 5000
      t.string  :top_notes, limit: 150
      t.string  :middle_notes, limit: 150
      t.string  :base_notes, limit: 150
      t.string  :accords, limit: 150
      t.text    :product_url, null: true

      # Categorization
      # t.string  :seasons, null: false, limit: 75
      # t.string  :occassions, null: false, limit: 240
      # t.string  :category, null: false, limit: 75
      # t.string  :subcategory, null: false, limit: 75

      # Slug for FriendlyID
      t.string :slug, index: { unique: true }

      # Discarded gem
      t.datetime :discarded_at, index: true

      # caching for acts_as_votable
      t.integer :cached_votes_total, default: 0
      t.integer :cached_votes_score, default: 0
      t.integer :cached_votes_up, default: 0
      t.integer :cached_votes_down, default: 0
      t.integer :cached_weighted_score, default: 0
      t.integer :cached_weighted_total, default: 0
      t.float   :cached_weighted_average, default: 0.0

      # acts_as_favoritable (acts_as_favoritor gem)
      t.text :favoritable_score
      t.text :favoritable_total

      t.timestamps
    end
  end
end
