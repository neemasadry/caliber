# == Schema Information
#
# Table name: reviews
#
#  id                      :bigint           not null, primary key
#  cached_votes_down       :integer          default(0)
#  cached_votes_score      :integer          default(0)
#  cached_votes_total      :integer          default(0)
#  cached_votes_up         :integer          default(0)
#  cached_weighted_average :float            default(0.0)
#  cached_weighted_score   :integer          default(0)
#  cached_weighted_total   :integer          default(0)
#  compliment              :integer          default(0), not null
#  quality                 :integer          default(0), not null
#  ratings                 :jsonb
#  reviewable_type         :string           not null
#  title                   :string(100)      not null
#  value                   :integer          default(0), not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  reviewable_id           :bigint           not null
#  user_id                 :bigint           not null
#
# Indexes
#
#  index_reviews_on_reviewable_type_and_reviewable_id  (reviewable_type,reviewable_id)
#  index_reviews_on_user_id                            (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
