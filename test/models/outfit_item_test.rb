# == Schema Information
#
# Table name: outfit_items
#
#  id               :bigint           not null, primary key
#  body_part        :string(75)       not null
#  category         :string(75)       not null
#  productable_type :string           not null
#  subcategory      :string(75)       not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  outfit_id        :bigint           not null
#  productable_id   :bigint           not null
#
# Indexes
#
#  index_outfit_items_on_outfit_id                            (outfit_id)
#  index_outfit_items_on_productable_type_and_productable_id  (productable_type,productable_id)
#
# Foreign Keys
#
#  fk_rails_...  (outfit_id => outfits.id)
#
require 'test_helper'

class OutfitItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
