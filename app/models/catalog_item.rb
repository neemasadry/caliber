# == Schema Information
#
# Table name: catalog_items
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  catalog_id :bigint           not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_catalog_items_on_catalog_id  (catalog_id)
#  index_catalog_items_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (catalog_id => catalogs.id)
#  fk_rails_...  (product_id => products.id)
#
class CatalogItem < ApplicationRecord
  belongs_to :catalogable_item, polymorphic: true
  belongs_to :catalog

  # has_ancestry

  validates :catalogable_item_type, presence: true, length: { maximum: 30 }
  validates :catalogable_item_id, presence: true, numericality: { only_integer: true }
  validates :catalog_id, presence: true, numericality: { only_integer: true }
end
