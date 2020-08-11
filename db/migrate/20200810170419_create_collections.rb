class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.references :user, null: false, foreign_key: true
      t.string :collection_type, null: false, limit: 30
      t.integer :total_items, null: false, default: 0
      t.decimal :total_price, null: false, default: 0.00, precision: 10, scale: 2

      # FriendlyID slug
      # t.string :slug, index: { unique: true }

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
