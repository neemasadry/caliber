# == Schema Information
#
# Table name: product_subcategories
#
#  id               :bigint           not null, primary key
#  productable_type :string
#  productable_id   :bigint
#  subcategory_id   :bigint
#
# Indexes
#
#  index_product_subcategories_on_productable     (productable_type,productable_id)
#  index_product_subcategories_on_subcategory_id  (subcategory_id)
#
# Foreign Keys
#
#  fk_rails_...  (subcategory_id => subcategories.id)
#
class ProductableSubcategoryItem < ApplicationRecord
  belongs_to :productable, polymorphic: true
  belongs_to :subcategory

  has_ancestry

  validates :productable_type, presence: true
  validates :productable_id, presence: true, uniqueness: { scope: [:subcategory_id, :productable_type] }
end
