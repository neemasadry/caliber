# == Schema Information
#
# Table name: outfit_catalog_items
#
#  id                     :bigint           not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  outfit_catalog_id      :bigint           not null
#  outfit_catalog_item_id :bigint           not null
#
# Indexes
#
#  index_outfit_catalog_items_on_outfit_catalog_id       (outfit_catalog_id)
#  index_outfit_catalog_items_on_outfit_catalog_item_id  (outfit_catalog_item_id)
#
# Foreign Keys
#
#  fk_rails_...  (outfit_catalog_id => outfit_catalogs.id)
#  fk_rails_...  (outfit_catalog_item_id => outfit_catalog_items.id)
#
require 'test_helper'

class OutfitCatalogItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
