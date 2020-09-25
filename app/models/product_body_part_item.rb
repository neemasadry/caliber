# == Schema Information
#
# Table name: product_body_part_items
#
#  id           :bigint           not null, primary key
#  body_part_id :bigint           not null
#  product_id   :bigint           not null
#
# Indexes
#
#  index_product_body_part_items_on_body_part_id  (body_part_id)
#  index_product_body_part_items_on_product_id    (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (body_part_id => body_parts.id)
#  fk_rails_...  (product_id => products.id)
#
class ProductBodyPartItem < ApplicationRecord
  # belongs_to :productable, polymorphic: true
  belongs_to :product
  belongs_to :body_part #, optional: true

  # validates :productable_type, presence: true
  # validates :productable_id, presence: true, uniqueness: { scope: [:body_part_id, :productable_type] }
end
