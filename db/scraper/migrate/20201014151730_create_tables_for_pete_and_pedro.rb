class CreateTablesForPeteAndPedro < ActiveRecord::Migration[6.0]
  def change
    create_table :pete_and_pedro_built_links do |t|

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


    create_table :pete_and_pedro_products do |t|

      t.string  :name, null: false, limit: 200
      t.text    :description, null: false, limit: 3000
      t.decimal :retail_price, null: false, precision: 10, scale: 2
      t.integer :gender, null: false
      t.string  :type_of, null: false, limit: 50
      t.text    :product_url, null: true, limit: 5000

      # Attributes
      t.jsonb   :fragrance_attributes, null: false, default: {}
      t.jsonb   :clothing_attributes, null: false, default: {}
      t.jsonb   :cosmetic_attributes, null: false, default: {}
      t.jsonb   :product_attributes, null: false, default: {}

      # References
      t.string :username, null: false
      t.string :account_name, null: false
      t.references :scraper_brand, null: false, foreign_key: true
      t.string :body_part, null: true
      t.string :category, null: true
      t.string :subcategory, null: true

      # Slug for FriendlyID
      t.string :slug, index: { unique: true }

      # Discarded gem
      t.datetime :discarded_at, index: true

      t.timestamps
    end
  end
end
