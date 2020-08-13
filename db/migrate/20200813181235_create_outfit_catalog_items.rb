class CreateOutfitCatalogItems < ActiveRecord::Migration[6.0]
  def change
    create_table :outfit_catalog_items do |t|
      t.references :outfit_catalog, null: false, foreign_key: true
      t.references :outfit_catalog_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
