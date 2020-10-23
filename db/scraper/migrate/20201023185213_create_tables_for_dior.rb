class CreateTablesForDior < ActiveRecord::Migration[6.0]
  def change
    create_table :dior_built_links do |t|

      t.string :product_name, null: false
      t.string :product_url, null: false

      t.jsonb :link_attributes, null: false, default: {}

      # References
      t.references :scraper_brand, null: false
      t.string :body_part, null: true
      t.string :category, null: true
      t.string :subcategory, null: true

      t.timestamps
    end


    create_table :dior_products do |t|

      t.string  :name, null: false, limit: 200
      t.text    :description, null: false, limit: 3000
      t.decimal :retail_price, null: false, precision: 10, scale: 2
      t.integer :gender, null: false
      t.string  :type_of, null: false, limit: 50
      t.text    :product_url, null: true, limit: 5000
      t.jsonb   :fragrance_attributes, null: false, default: {}
      t.jsonb   :clothing_attributes, null: false, default: {}
      t.jsonb   :cosmetic_attributes, null: false, default: {}

      t.jsonb :product_attributes, null: false, default: {}

      # References
      t.references :scraper_brand, null: false
      t.string :body_part, null: true
      t.string :category, null: true
      t.string :subcategory, null: true

      t.timestamps
    end
  end
end
