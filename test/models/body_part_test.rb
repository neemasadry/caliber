# == Schema Information
#
# Table name: body_parts
#
#  id                 :bigint           not null, primary key
#  name               :string(75)       not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  body_part_group_id :bigint           not null
#
# Indexes
#
#  index_body_parts_on_body_part_group_id  (body_part_group_id)
#  index_body_parts_on_name                (name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (body_part_group_id => body_part_groups.id)
#
require 'test_helper'

class BodyPartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
