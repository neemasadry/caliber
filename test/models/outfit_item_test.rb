# == Schema Information
#
# Table name: outfit_items
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  outfit_id  :bigint           not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_outfit_items_on_outfit_id   (outfit_id)
#  index_outfit_items_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (outfit_id => outfits.id)
#  fk_rails_...  (product_id => products.id)
#
require 'test_helper'

class OutfitItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
