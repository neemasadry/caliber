# == Schema Information
#
# Table name: productable_body_part_items
#
#  id               :bigint           not null, primary key
#  productable_type :string
#  body_part_id     :bigint
#  productable_id   :bigint
#
# Indexes
#
#  index_productable_body_part_items_on_body_part_id  (body_part_id)
#  index_productable_body_part_on_type_and_id         (productable_type,productable_id)
#
# Foreign Keys
#
#  fk_rails_...  (body_part_id => body_parts.id)
#
class ProductableBodyPartItem < ApplicationRecord
  belongs_to :productable, polymorphic: true
  belongs_to :body_part #, optional: true

  validates :productable_type, presence: true
  validates :productable_id, presence: true, uniqueness: { scope: [:body_part_id, :productable_type] }
end
