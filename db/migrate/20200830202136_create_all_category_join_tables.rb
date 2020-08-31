class CreateAllCategoryJoinTables < ActiveRecord::Migration[6.0]
  def change

    create_table :brand_categories do |t|
      t.references :brand, foreign_key: true
      t.references :category, foreign_key: true
    end

    create_table :product_categories do |t|
      t.references :productable, polymorphic: true, index: { name: "index_product_categories_on_productable" }
      t.references :category, foreign_key: true
    end

    create_table :review_categories do |t|
      t.references :review, foreign_key: true
      t.references :category, foreign_key: true
    end

    create_table :guide_categories do |t|
      t.references :guide, foreign_key: true
      t.references :category, foreign_key: true
    end


    create_table :outfit_categories do |t|
      t.references :outfit, foreign_key: true
      t.references :category, foreign_key: true
    end

    create_table :outfit_item_categories do |t|
      t.references :outfit_items, foreign_key: true
      t.references :category, foreign_key: true
    end


    create_table :catalog_categories do |t|
      t.references :catalog, foreign_key: true
      t.references :category, foreign_key: true
    end

  end
end
