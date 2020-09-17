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
require 'test_helper'

class CatalogItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
