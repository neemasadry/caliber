class CreateAllSubcategoryJoinTables < ActiveRecord::Migration[6.0]
  def change

    create_table :brand_subcategories do |t|
      t.references :brand, foreign_key: true
      t.references :subcategory, foreign_key: true
    end

    create_table :product_subcategories do |t|
      t.references :productable, polymorphic: true, index: { name: "index_product_subcategories_on_productable" }
      t.references :subcategory, foreign_key: true
    end

    create_table :review_subcategories do |t|
      t.references :review, foreign_key: true
      t.references :subcategory, foreign_key: true
    end

    create_table :guide_subcategories do |t|
      t.references :guide, foreign_key: true
      t.references :subcategory, foreign_key: true
    end

    create_table :outfit_subcategories do |t|
      t.references :outfit, foreign_key: true
      t.references :subcategory, foreign_key: true
    end
    create_table :outfit_item_subcategories do |t|
      t.references :outfit_items, foreign_key: true
      t.references :subcategory, foreign_key: true
    end

    create_table :catalog_subcategories do |t|
      t.references :catalog, foreign_key: true
      t.references :subcategory, foreign_key: true
    end

  end
end
