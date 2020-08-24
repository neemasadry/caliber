# Original timestamp: 20200823194527
class CreateSuits < ActiveRecord::Migration[6.0]
  def change
    create_table :suits do |t|
      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
      t.references :top, null: false, foreign_key: true
      t.references :bottom, null: false, foreign_key: true

      # General product characteristics
      t.string  :name, null: false, limit: 100
      t.text    :description, null: false, limit: 3000
      t.decimal :retail_price, null: false, precision: 10, scale: 2
      t.string  :gender, null: false, limit: 6
      t.text    :materials, null: true, limit: 5000
      t.string  :primary_color, null: false, limit: 30
      t.string  :secondary_color, null: true, limit: 30
      t.text    :product_url, null: true

      # Suit-specific characteristics
      t.string :suit_type, null: false, limit: 75
      t.string :jacket_breasted_style, null: false, limit: 75
      t.integer :jacket_number_of_buttons, null: false, default: 1, inclusion: 0..30
      t.string :jacket_lapel_style, null: false, limit: 75
      t.string :jacket_pocket_style, null: false, limit: 75
      t.boolean :jacket_ticket_pocket, null: false, default: false
      t.string :jacket_vents_style, null: false, limit: 75
      t.string :jacket_sleeve_buttons, null: false, limit: 75
      t.string :trouser_waistband_style, null: false, limit: 75
      t.string :trouser_pleats, null: false, limit: 75
      t.string :trouser_cuff, null: false, limit: 75

      # Categorization
      t.string  :body_part, null: false, limit: 50
      t.string  :category, null: false, limit: 75
      t.string  :subcategory, null: false, limit: 75

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
