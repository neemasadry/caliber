class CreateCatalogItems < ActiveRecord::Migration[6.0]
  def change
    create_table :catalog_items do |t|
      # t.references :catalogable_item, polymorphic: true, null: false, index: { name: :index_catalogable_items_on_ccatalogable_type_and_id }
      t.references :product, null: false, foreign_key: true
      t.references :catalog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
