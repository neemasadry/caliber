# Original timestamp: 20200827175912
class CreateBodyParts < ActiveRecord::Migration[6.0]
  def change
    create_table :body_parts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.references :category_group, null: false, foreign_key: true

      t.string :name, null: false, limit: 150

      t.timestamps
    end
  end
end
