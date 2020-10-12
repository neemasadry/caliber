class CreateAllCategoryJoinTables < ActiveRecord::Migration[6.0]
  def change

    create_table :brand_category_items do |t|
      t.references :brand, foreign_key: true
      t.references :category, foreign_key: true
      # t.string :ancestry
    end

    # create_table :productable_category_items do |t|
    #   t.references :productable, polymorphic: true, index: { name: "index_product_category_items_on_productable" }
    #   t.references :category, foreign_key: true
    #   # t.string :ancestry
    # end

    create_table :product_category_items do |t|
      t.references :product, null: false, foreign_key: true
      t.references :category, foreign_key: true
      # t.string :ancestry
    end
    create_table :review_category_items do |t|
      t.references :review, foreign_key: true
      t.references :category, foreign_key: true
      # t.string :ancestry
    end

    create_table :guide_category_items do |t|
      t.references :guide, foreign_key: true
      t.references :category, foreign_key: true
      # t.string :ancestry
    end

    create_table :outfit_category_items do |t|
      t.references :outfit, foreign_key: true
      t.references :category, foreign_key: true
      # t.string :ancestry
    end

    create_table :outfit_item_category_items do |t|
      t.references :outfit_items, foreign_key: true
      t.references :category, foreign_key: true
      # t.string :ancestry
    end

    create_table :catalog_category_items do |t|
      t.references :catalog, foreign_key: true
      t.references :category, foreign_key: true
      # t.string :ancestry
    end

  end
end
