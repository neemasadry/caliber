class CreateGuides < ActiveRecord::Migration[6.0]
  def change
    create_table :guides do |t|

      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.references :brand, null: true, foreign_key: true

      t.string :title, null: false, limit: 80
      t.string :category, null: false, limit: 30
      t.string :subcategory_one, null: true, limit: 30
      t.string :subcategory_two, null: true, limit: 30

      # Shrine uploader
      t.text :guide_image_data, null: true

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

      t.timestamps
    end
  end
end
