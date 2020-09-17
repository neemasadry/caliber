# == Schema Information
#
# Table name: accessories
#
#  id              :bigint           not null, primary key
#  materials       :text
#  primary_color   :string(30)       not null
#  secondary_color :string(30)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  product_id      :bigint           not null
#
# Indexes
#
#  index_accessories_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
require 'test_helper'

class AccessoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
