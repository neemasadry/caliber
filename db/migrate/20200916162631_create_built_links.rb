class CreateBuiltLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :built_links do |t|

      t.string :product_name, null: false
      t.string :product_url, null: false

      t.jsonb :link_attributes, null: false, default: {}

      # References
      t.references :brand, null: false, foreign_key: true
      t.references :body_part, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :subcategory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
