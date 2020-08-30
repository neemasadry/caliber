class AddAncestryToAll < ActiveRecord::Migration[6.0]
  def change
    safety_assured {
      add_column :users, :ancestry, :string
      add_index :users, :ancestry

      add_column :accounts, :ancestry, :string
      add_index :accounts, :ancestry

      add_column :brands, :ancestry, :string
      add_index :brands, :ancestry

      add_column :accessories, :ancestry, :string
      add_index :accessories, :ancestry

      add_column :bottoms, :ancestry, :string
      add_index :bottoms, :ancestry

      add_column :cosmetics, :ancestry, :string
      add_index :cosmetics, :ancestry

      add_column :dresses, :ancestry, :string
      add_index :dresses, :ancestry

      add_column :fragrances, :ancestry, :string
      add_index :fragrances, :ancestry

      add_column :jewelries, :ancestry, :string
      add_index :jewelries, :ancestry

      add_column :shoes, :ancestry, :string
      add_index :shoes, :ancestry

      add_column :suits, :ancestry, :string
      add_index :suits, :ancestry

      add_column :tops, :ancestry, :string
      add_index :tops, :ancestry

      add_column :reviews, :ancestry, :string
      add_index :reviews, :ancestry

      add_column :guides, :ancestry, :string
      add_index :guides, :ancestry

      add_column :comments, :ancestry, :string
      add_index :comments, :ancestry

      add_column :posts, :ancestry, :string
      add_index :posts, :ancestry

      add_column :collections, :ancestry, :string
      add_index :collections, :ancestry

      add_column :collection_items, :ancestry, :string
      add_index :collection_items, :ancestry

      add_column :outfits, :ancestry, :string
      add_index :outfits, :ancestry

      add_column :outfit_items, :ancestry, :string
      add_index :outfit_items, :ancestry

      add_column :catalogs, :ancestry, :string
      add_index :catalogs, :ancestry

      add_column :catalog_items, :ancestry, :string
      add_index :catalog_items, :ancestry

      # add_column :category_groups, :ancestry, :string
      # add_index :category_groups, :ancestry

      # add_column :categories, :ancestry, :string
      # add_index :categories, :ancestry

      # add_column :subcategories, :ancestry, :string
      # add_index :subcategories, :ancestry

      # add_column :body_parts, :ancestry, :string
      # add_index :body_parts, :ancestry
    } # safety_assured

  end
end
