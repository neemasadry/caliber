# == Schema Information
#
# Table name: catalog_category_items
#
#  id          :bigint           not null, primary key
#  catalog_id  :bigint
#  category_id :bigint
#
# Indexes
#
#  index_catalog_category_items_on_catalog_id   (catalog_id)
#  index_catalog_category_items_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (catalog_id => catalogs.id)
#  fk_rails_...  (category_id => categories.id)
#
class CatalogCategoryItem < ApplicationRecord
  belongs_to :catalog
  belongs_to :category

  # has_ancestry
end
