# == Schema Information
#
# Table name: category_groups
#
#  id                  :bigint           not null, primary key
#  categories_count    :integer          default(0), not null
#  name                :string(150)      not null
#  subcategories_count :integer          default(0), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_category_groups_on_name  (name) UNIQUE
#
require 'test_helper'

class CategoryGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
