class CreateOutfitItems < ActiveRecord::Migration[6.0]
  def change
    create_table :outfit_items do |t|
      t.references :outfit, null: false, foreign_key: true
      t.references :productable, polymorphic: true, null: false
      # t.references :body_part, null: false, foreign_key: true
      # t.references :category, null: false, foreign_key: true
      # t.references :subcategory, null: false, foreign_key: true

      # t.string :body_part, null: false, limit: 75
      # t.string :category, null: false, limit: 75
      # t.string :subcategory, null: false, limit: 75

      t.timestamps
    end
  end
end
