# == Schema Information
#
# Table name: product_category_items
#
#  id          :bigint           not null, primary key
#  category_id :bigint
#  product_id  :bigint           not null
#
# Indexes
#
#  index_product_category_items_on_category_id  (category_id)
#  index_product_category_items_on_product_id   (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (product_id => products.id)
#
class ProductCategoryItem < ApplicationRecord
  # belongs_to :productable, polymorphic: true
  belongs_to :product
  belongs_to :category

  # has_ancestry

  # validates :productable_type, presence: true
  # validates :productable_id, presence: true, uniqueness: { scope: [:category_id, :productable_type] }
end
