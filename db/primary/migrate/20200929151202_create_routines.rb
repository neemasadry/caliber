class CreateRoutines < ActiveRecord::Migration[6.0]
  def change
    create_table :routines do |t|
      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.references :brand, null: true, foreign_key: true

      t.string  :name, null: false, limit: 125
      t.text    :description, null: false, limit: 3000
      t.jsonb   :action_days, null: false, default: {}
      t.time    :est_time
      t.integer :total_steps

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
