class CreateOutfitItems < ActiveRecord::Migration[6.0]
  def change
    create_table :outfit_items do |t|
      t.references :outfit, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      # t.references :productable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
