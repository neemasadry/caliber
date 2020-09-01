# == Schema Information
#
# Table name: productable_category_items
#
#  id               :bigint           not null, primary key
#  productable_type :string
#  category_id      :bigint
#  productable_id   :bigint
#
# Indexes
#
#  index_product_category_items_on_productable      (productable_type,productable_id)
#  index_productable_category_items_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class ProductableCategoryItem < ApplicationRecord
  belongs_to :productable, polymorphic: true
  belongs_to :category

  # has_ancestry

  validates :productable_type, presence: true
  validates :productable_id, presence: true, uniqueness: { scope: [:category_id, :productable_type] }
end
