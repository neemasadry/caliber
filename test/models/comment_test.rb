# == Schema Information
#
# Table name: comments
#
#  id                      :bigint           not null, primary key
#  ancestry                :string
#  body                    :text             not null
#  cached_votes_down       :integer          default(0)
#  cached_votes_score      :integer          default(0)
#  cached_votes_total      :integer          default(0)
#  cached_votes_up         :integer          default(0)
#  cached_weighted_average :float            default(0.0)
#  cached_weighted_score   :integer          default(0)
#  cached_weighted_total   :integer          default(0)
#  commentable_type        :string           not null
#  deleted                 :boolean          default(FALSE), not null
#  discarded_at            :datetime
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  account_id              :bigint           not null
#  brand_id                :bigint
#  commentable_id          :integer          not null
#  parent_id               :integer          default(0), not null
#  user_id                 :bigint           not null
#
# Indexes
#
#  index_comments_on_account_id        (account_id)
#  index_comments_on_ancestry          (ancestry)
#  index_comments_on_brand_id          (brand_id)
#  index_comments_on_commentable_id    (commentable_id)
#  index_comments_on_commentable_type  (commentable_type)
#  index_comments_on_discarded_at      (discarded_at)
#  index_comments_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
