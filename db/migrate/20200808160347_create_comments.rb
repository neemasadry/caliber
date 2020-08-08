class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|

      t.string :commentable_type, null: false, index: true
      t.integer :commentable_id, null: false, index: true

      t.integer :parent_id, null: false, default: 0

      t.references :user, null: false, foreign_key: true, index: true
      t.references :account, null: false, foreign_key: true, index: true
      t.references :brand, null: true, foreign_key: true, index: true

      t.text :body, null: false, limit: 1500
      t.boolean :deleted, null: false, default: false

      t.timestamps
    end
  end
end
