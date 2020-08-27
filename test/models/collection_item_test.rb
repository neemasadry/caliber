# == Schema Information
#
# Table name: collection_items
#
#  id                    :bigint           not null, primary key
#  ancestry              :string
#  collectable_item_type :string           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  collectable_item_id   :bigint           not null
#  collection_id         :bigint           not null
#
# Indexes
#
#  index_collection_items_on_ancestry                 (ancestry)
#  index_collection_items_on_collectable_type_and_id  (collectable_item_type,collectable_item_id)
#  index_collection_items_on_collection_id            (collection_id)
#
# Foreign Keys
#
#  fk_rails_...  (collection_id => collections.id)
#
require 'test_helper'

class CollectionItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
