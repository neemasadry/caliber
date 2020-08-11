class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.references :user, null: false, foreign_key: true
      t.string :collection_type, null: false, limit: 30
      t.integer :total_items, null: false, default: 0
      t.decimal :total_price, null: false, default: 0.00, precision: 10, scale: 2

      t.timestamps
    end
  end
end
