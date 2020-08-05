class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|

      t.references :reviewable, polymorphic: true, null: false
      t.references :user, null: false, foreign_key: true

      t.string  :title, null: false, limit: 100
      t.integer :quality, null: false, default: 0
      t.integer :value, null: false, default: 0
      t.integer :compliment, null: false, default: 0
      t.jsonb   :ratings, null: false

      # Slug for FriendlyID
      t.string :slug, index: { unique: true }

      # caching for acts_as_votable
      t.integer :cached_votes_total, default: 0
      t.integer :cached_votes_score, default: 0
      t.integer :cached_votes_up, default: 0
      t.integer :cached_votes_down, default: 0
      t.integer :cached_weighted_score, default: 0
      t.integer :cached_weighted_total, default: 0
      t.float   :cached_weighted_average, default: 0.0

      t.timestamps
    end
  end
end
