class CreateCollectionItems < ActiveRecord::Migration[6.0]
  def change
    create_table :collection_items do |t|
      t.references :collectable_item, polymorphic: true, null: false, index: { name: :index_collection_items_on_collectable_type_and_id }
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
