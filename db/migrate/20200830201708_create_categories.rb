class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false, limit: 150, index: { unique: true }
      t.integer :subcategories_count, null: false, default: 0
      # t.string :ancestry

      t.references :category_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
