class CreateCategoryGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :category_groups do |t|
      t.string :name, null: false, limit: 150, index: { unique: true }
      t.integer :categories_count, null: false, default: 0
      t.integer :subcategories_count, null: false, default: 0
      # t.string :ancestry

      t.timestamps
    end
  end
end
