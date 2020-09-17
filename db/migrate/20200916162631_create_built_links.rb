class CreateBuiltLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :built_links do |t|

      t.string :product_url, null: false
      t.string :category, null: true
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
