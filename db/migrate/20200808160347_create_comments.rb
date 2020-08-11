class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|

      t.string :commentable_type, null: false, index: true
      t.integer :commentable_id, null: false, index: true

      t.integer :parent_id, null: false, default: 0

      t.references :user, null: false, foreign_key: true, index: true
      t.references :account, null: false, foreign_key: true, index: true
      t.references :brand, null: true, foreign_key: true, index: true

      t.text :body, null: false, limit: 1500
      t.boolean :deleted, null: false, default: false

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

      t.timestamps
    end
  end
end
