class CreateOutfitItemBodyPartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :outfit_item_body_part_items do |t|
      t.references :outfit_item, null: false, foreign_key: true
      t.references :body_part, null: false, foreign_key: true
    end
  end
end
