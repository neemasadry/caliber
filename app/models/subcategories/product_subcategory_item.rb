# == Schema Information
#
# Table name: product_subcategory_items
#
#  id             :bigint           not null, primary key
#  product_id     :bigint           not null
#  subcategory_id :bigint
#
# Indexes
#
#  index_product_subcategory_items_on_product_id      (product_id)
#  index_product_subcategory_items_on_subcategory_id  (subcategory_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (subcategory_id => subcategories.id)
#
class ProductSubcategoryItem < ApplicationRecord
  # belongs_to :productable, polymorphic: true
  belongs_to :product
  belongs_to :subcategory

  # has_ancestry

  # validates :productable_type, presence: true
  # validates :productable_id, presence: true, uniqueness: { scope: [:subcategory_id, :productable_type] }
end
