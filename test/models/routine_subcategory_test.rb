# == Schema Information
#
# Table name: routine_subcategories
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  routine_id     :bigint           not null
#  subcategory_id :bigint           not null
#
# Indexes
#
#  index_routine_subcategories_on_routine_id      (routine_id)
#  index_routine_subcategories_on_subcategory_id  (subcategory_id)
#
require 'test_helper'

class RoutineSubcategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
