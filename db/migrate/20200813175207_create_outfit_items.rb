class CreateOutfitItems < ActiveRecord::Migration[6.0]
  def change
    create_table :outfit_items do |t|
      t.references :outfit, null: false, foreign_key: true
      t.references :productable, polymorphic: true, null: false

      t.string :body_part, null: false, limit: 50

      t.timestamps
    end
  end
end
