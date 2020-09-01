class CreateProductableBodyPartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :productable_body_part_items do |t|
      t.references :productable, polymorphic: true, index: { name: "index_productable_body_part_on_type_and_id" }
      t.references :body_part, foreign_key: true
    end
  end
end
