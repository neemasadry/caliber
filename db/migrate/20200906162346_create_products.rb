class CreateProducts < ActiveRecord::Migration[6.0]
  def change
=begin
    product_table_names = [:accessories, :bottoms, :cosmetics, :dresses, :fragrances, :jewelries, :shoes, :suits, :tops]

    product_table_names.each do |table_name|
      create_table table_name do |t|
        t.references :user, null: false, foreign_key: true
        t.references :account, null: false, foreign_key: true
        t.references :brand, null: false, foreign_key: true
        # t.references :body_part_group, null: false, index: true
        # t.references :body_part, null: false, index: true
        # t.references :category_group, null: false, index: true
        # t.references :category, null: false, index: true
        # t.references :subcategory, null: false, index: true

        t.string  :name, null: false, limit: 100
        t.text    :description, null: false, limit: 3000
        t.decimal :retail_price, null: false, precision: 10, scale: 2
        t.text    :product_url, null: true

        if table_name != :cosmetics || table_name != :fragrances || table_name != :dresses
          t.string  :gender, null: false, limit: 6
          t.text    :materials, null: true, limit: 5000
          t.string  :primary_color, null: false, limit: 30
          t.string  :secondary_color, null: true, limit: 30
        elsif table_name == :cosmetics
          t.text    :ingredients, null: true, limit: 5000
        elsif table_name == :fragrances
          t.date    :release_date
          t.text    :ingredients, null: true, limit: 5000
          t.string  :top_notes, limit: 150
          t.string  :middle_notes, limit: 150
          t.string  :base_notes, limit: 150
          t.string  :accords, limit: 150
        end


        # Categorization
        # t.string  :body_part, null: false, limit: 50
        # t.string  :category, null: false, limit: 75
        # t.string  :subcategory, null: false, limit: 75

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
=end
    create_table :products do |t|
      t.string :name, null: false, limit: 100
      t.references :productable, polymorphic: true, null: false
      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true

      # Slug for FriendlyID
      t.string :slug, index: { unique: true }

      # Discard gem
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
