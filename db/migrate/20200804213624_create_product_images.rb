# Original timestamp: 20200805024348

class CreateProductImages < ActiveRecord::Migration[6.0]
  def change
    create_table :product_images do |t|

      t.references :product_imageable,  polymorphic: true, index: { name: :index_for_product_imageable }, null: false
      t.references :user,  foreign_key: true, null: false
      t.references :brand, foreign_key: true, null: false

      # Shrine
      t.text       :product_image_data, null: false

      t.timestamps
    end
  end
end
