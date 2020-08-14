# == Schema Information
#
# Table name: catalog_items
#
#  id                    :bigint           not null, primary key
#  catalogable_item_type :string           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  catalog_id            :bigint           not null
#  catalogable_item_id   :bigint           not null
#
# Indexes
#
#  index_catalog_items_on_catalog_id                    (catalog_id)
#  index_catalogable_items_on_ccatalogable_type_and_id  (catalogable_item_type,catalogable_item_id)
#
# Foreign Keys
#
#  fk_rails_...  (catalog_id => catalogs.id)
#
class CatalogItem < ApplicationRecord
  belongs_to :catalogable_item, polymorphic: true
  belongs_to :catalog

  validates :catalogable_item_type, presence: true, length: { maximum: 30 }
  validates :catalogable_item_id, presence: true, numericality: { only_integer: true }
  validates :catalog_id, presence: true, numericality: { only_integer: true }
end
