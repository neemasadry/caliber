class CreateScraperBuiltLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :scraper_built_links do |t|

      t.string :product_name, null: false
      t.string :product_url, null: false

      t.jsonb :link_attributes, null: false, default: {}

      # References
      t.string :brand_identifier, null: false
      t.string :body_part_name, null: true
      t.string :category_name, null: true
      t.string :subcategory_name, null: true

      t.timestamps
    end
  end
end
