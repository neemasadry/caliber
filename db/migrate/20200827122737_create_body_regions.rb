# Original timestamp: 20200827184225
class CreateBodyRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :body_regions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.references :category_group, null: false, foreign_key: true

      t.string :name, null: false, limit: 150
      t.integer :body_part_count, null: false, default: 0

      t.timestamps
    end
  end
end
