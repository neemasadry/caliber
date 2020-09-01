class CreateAllSubcategoryJoinTables < ActiveRecord::Migration[6.0]
  def change

    create_table :brand_subcategory_items do |t|
      t.references :brand, foreign_key: true
      t.references :subcategory, foreign_key: true
      # t.string :ancestry
    end

    create_table :productable_subcategory_items do |t|
      t.references :productable, polymorphic: true, index: { name: "index_product_subcategory_items_on_productable" }
      t.references :subcategory, foreign_key: true
      # t.string :ancestry
    end

    create_table :review_subcategory_items do |t|
      t.references :review, foreign_key: true
      t.references :subcategory, foreign_key: true
      # t.string :ancestry
    end

    create_table :guide_subcategory_items do |t|
      t.references :guide, foreign_key: true
      t.references :subcategory, foreign_key: true
      # t.string :ancestry
    end

    create_table :outfit_subcategory_items do |t|
      t.references :outfit, foreign_key: true
      t.references :subcategory, foreign_key: true
      # t.string :ancestry
    end

    create_table :outfit_item_subcategory_items do |t|
      t.references :outfit_items, foreign_key: true
      t.references :subcategory, foreign_key: true
      # t.string :ancestry
    end

    create_table :catalog_subcategory_items do |t|
      t.references :catalog, foreign_key: true
      t.references :subcategory, foreign_key: true
      # t.string :ancestry
    end

  end
end
