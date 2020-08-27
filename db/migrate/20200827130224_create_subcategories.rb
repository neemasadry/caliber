class CreateSubcategories < ActiveRecord::Migration[6.0]
  def change
    create_table :subcategories do |t|
      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.string :name, null: false, limit: 150

      t.integer :brands_count, null: false, default: 0
      t.integer :accessories_count, null: false, default: 0
      t.integer :bottoms_count, null: false, default: 0
      t.integer :cosmetics_count, null: false, default: 0
      t.integer :dresses_count, null: false, default: 0
      t.integer :fragrances_count, null: false, default: 0
      t.integer :jewelries_count, null: false, default: 0
      t.integer :shoes_count, null: false, default: 0
      t.integer :suits_count, null: false, default: 0
      t.integer :tops_count, null: false, default: 0
      t.integer :total_products_count, null: false, default: 0
      t.integer :reviews_count, null: false, default: 0
      t.integer :guides_count, null: false, default: 0
      t.integer :outfits_count, null: false, default: 0
      t.integer :catalogs_count, null: false, default: 0

      # Discard gem
      t.datetime :discarded_at, index: true

      t.timestamps
    end
  end
end
