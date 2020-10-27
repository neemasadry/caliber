class CreateScraperBuiltLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :scraper_built_links do |t|

      t.string :product_name, null: false
      t.string :product_url, null: false
      t.integer :gender, null: true

      t.jsonb :link_attributes, null: false, default: {}

      # References
      t.references :scraper_brand, null: false, foreign_key: true
      t.string :body_part, null: true
      t.string :category, null: true
      t.string :subcategory, null: true

      t.timestamps
    end
  end
end
