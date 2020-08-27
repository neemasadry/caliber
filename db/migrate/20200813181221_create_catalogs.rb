class CreateCatalogs < ActiveRecord::Migration[6.0]
  def change
    create_table :catalogs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.references :brand, null: true, foreign_key: true
      t.references :category, null: false, index: true
      t.references :subcategory, null: false, index: true

      t.string :title, null: false, limit: 150, index: true
      t.text :description, null: false, limit: 3000
      # t.string :category, null: false, limit: 150
      # t.string :subcategory, null: false, limit: 150
      t.integer :total_items, null: false, default: 0
      t.decimal :total_price, precision: 10, scale: 2, null: false, default: 0.00

      # FriendlyID slug
      t.string :slug, index: { unique: true }

      # Discard gem
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
