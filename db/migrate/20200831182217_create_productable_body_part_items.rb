class CreateProductableBodyPartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :productable_body_part_items do |t|
      t.references :productable, polymorphic: true, null: false, index: { name: "index_productable_body_part_on_type_and_id" }
      t.references :body_part, null: false, foreign_key: true
    end
  end
end
