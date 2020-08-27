# == Schema Information
#
# Table name: collections
#
#  id                      :bigint           not null, primary key
#  ancestry                :string
#  cached_votes_down       :integer          default(0)
#  cached_votes_score      :integer          default(0)
#  cached_votes_total      :integer          default(0)
#  cached_votes_up         :integer          default(0)
#  cached_weighted_average :float            default(0.0)
#  cached_weighted_score   :integer          default(0)
#  cached_weighted_total   :integer          default(0)
#  collection_type         :string(30)       not null
#  discarded_at            :datetime
#  favoritable_score       :text
#  favoritable_total       :text
#  total_items             :integer          default(0), not null
#  total_price             :decimal(10, 2)   default(0.0), not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  user_id                 :bigint           not null
#
# Indexes
#
#  index_collections_on_ancestry      (ancestry)
#  index_collections_on_discarded_at  (discarded_at)
#  index_collections_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class CollectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
