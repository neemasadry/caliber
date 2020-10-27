# == Schema Information
#
# Table name: built_links
#
#  id              :bigint           not null, primary key
#  gender          :integer
#  link_attributes :jsonb            not null
#  product_name    :string           not null
#  product_url     :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  body_part_id    :bigint
#  brand_id        :bigint           not null
#  category_id     :bigint
#  subcategory_id  :bigint
#
# Indexes
#
#  index_built_links_on_body_part_id    (body_part_id)
#  index_built_links_on_brand_id        (brand_id)
#  index_built_links_on_category_id     (category_id)
#  index_built_links_on_subcategory_id  (subcategory_id)
#
# Foreign Keys
#
#  fk_rails_...  (body_part_id => body_parts.id)
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (subcategory_id => subcategories.id)
#
require 'test_helper'

class BuiltLinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
