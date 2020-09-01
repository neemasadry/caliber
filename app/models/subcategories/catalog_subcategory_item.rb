# == Schema Information
#
# Table name: catalog_subcategory_items
#
#  id             :bigint           not null, primary key
#  catalog_id     :bigint
#  subcategory_id :bigint
#
# Indexes
#
#  index_catalog_subcategory_items_on_catalog_id      (catalog_id)
#  index_catalog_subcategory_items_on_subcategory_id  (subcategory_id)
#
# Foreign Keys
#
#  fk_rails_...  (catalog_id => catalogs.id)
#  fk_rails_...  (subcategory_id => subcategories.id)
#
class CatalogSubcategoryItem < ApplicationRecord
  belongs_to :catalog
  belongs_to :subcategory

  # has_ancestry
end
