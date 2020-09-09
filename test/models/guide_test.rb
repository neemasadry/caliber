# == Schema Information
#
# Table name: guides
#
#  id                      :bigint           not null, primary key
#  cached_votes_down       :integer          default(0)
#  cached_votes_score      :integer          default(0)
#  cached_votes_total      :integer          default(0)
#  cached_votes_up         :integer          default(0)
#  cached_weighted_average :float            default(0.0)
#  cached_weighted_score   :integer          default(0)
#  cached_weighted_total   :integer          default(0)
#  discarded_at            :datetime
#  favoritable_score       :text
#  favoritable_total       :text
#  slug                    :string
#  title                   :string(80)       not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  account_id              :bigint           not null
#  brand_id                :bigint
#  user_id                 :bigint           not null
#
# Indexes
#
#  index_guides_on_account_id    (account_id)
#  index_guides_on_brand_id      (brand_id)
#  index_guides_on_discarded_at  (discarded_at)
#  index_guides_on_slug          (slug) UNIQUE
#  index_guides_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class GuideTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
