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
require 'test_helper'

class CatalogItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
