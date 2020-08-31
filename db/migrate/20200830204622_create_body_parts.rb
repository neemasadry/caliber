class CreateBodyParts < ActiveRecord::Migration[6.0]
  def change
    create_table :body_parts do |t|
      t.string :name, null: false, limit: 75, index: { unique: true }
      t.string :ancestry, null: false, default: 0
      t.references :body_part_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
