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
#  discarded_at            :datetime
#  favoritable_score       :text
#  favoritable_total       :text
#  quality                 :integer          default(0), not null
#  ratings                 :jsonb            not null
#  slug                    :string
#  title                   :string(100)      not null
#  value                   :integer          default(0), not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  account_id              :bigint           not null
#  product_id              :bigint           not null
#  user_id                 :bigint           not null
#
# Indexes
#
#  index_reviews_on_account_id    (account_id)
#  index_reviews_on_discarded_at  (discarded_at)
#  index_reviews_on_product_id    (product_id)
#  index_reviews_on_slug          (slug) UNIQUE
#  index_reviews_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
