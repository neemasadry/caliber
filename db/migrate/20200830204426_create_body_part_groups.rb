class CreateBodyPartGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :body_part_groups do |t|
      t.string :name, null: false, limit: 75, index: { unique: true }
      # t.string :ancestry
      t.integer :body_parts_count, null: false, default: 0

      t.timestamps
    end
  end
end
