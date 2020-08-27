# == Schema Information
#
# Table name: body_parts
#
#  id                :bigint           not null, primary key
#  name              :string(150)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  account_id        :bigint           not null
#  category_group_id :bigint           not null
#  user_id           :bigint           not null
#
# Indexes
#
#  index_body_parts_on_account_id         (account_id)
#  index_body_parts_on_category_group_id  (category_group_id)
#  index_body_parts_on_user_id            (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (category_group_id => category_groups.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class BodyPartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
