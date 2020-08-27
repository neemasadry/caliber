class CreateCategoryGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :category_groups do |t|
      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true

      t.string :name, null: false, limit: 150
      t.integer :categories_count, null: false, default: 0

      # Discard gem
      t.datetime :discarded_at, index: true

      t.timestamps
    end
  end
end
