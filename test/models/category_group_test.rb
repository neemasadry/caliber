# == Schema Information
#
# Table name: category_groups
#
#  id               :bigint           not null, primary key
#  ancestry         :string
#  categories_count :integer          default(0), not null
#  discarded_at     :datetime
#  name             :string(150)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  account_id       :bigint           not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_category_groups_on_account_id    (account_id)
#  index_category_groups_on_ancestry      (ancestry)
#  index_category_groups_on_discarded_at  (discarded_at)
#  index_category_groups_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class CategoryGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
