class CreateShoes < ActiveRecord::Migration[6.0]
  def change
    create_table :shoes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true

      t.string  :name, null: false, limit: 100
      #t.text    :product_image_data, null: false
      t.text    :description, null: false, limit: 3000
      t.decimal :retail_price, null: false, precision: 10, scale: 2
      t.string  :type_of, null: false, limit: 80
      t.string  :gender, null: false, limit: 6
      t.text    :materials, null: true, limit: 5000
      t.string  :primary_color, null: false, limit: 30
      t.string  :secondary_color, null: true, limit: 30
      t.text    :product_url, null: true

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

      # acts_as_favoritable (acts_as_favoritor gem)
      t.text :favoritable_score
      t.text :favoritable_total

      t.timestamps
    end
  end
end
