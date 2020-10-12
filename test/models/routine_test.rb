# == Schema Information
#
# Table name: routines
#
#  id                      :bigint           not null, primary key
#  action_days             :jsonb            not null
#  cached_votes_down       :integer          default(0)
#  cached_votes_score      :integer          default(0)
#  cached_votes_total      :integer          default(0)
#  cached_votes_up         :integer          default(0)
#  cached_weighted_average :float            default(0.0)
#  cached_weighted_score   :integer          default(0)
#  cached_weighted_total   :integer          default(0)
#  description             :text             not null
#  discarded_at            :datetime
#  est_time                :time
#  favoritable_score       :text
#  favoritable_total       :text
#  name                    :string(125)      not null
#  slug                    :string
#  total_steps             :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  account_id              :bigint           not null
#  brand_id                :bigint
#  user_id                 :bigint           not null
#
# Indexes
#
#  index_routines_on_account_id    (account_id)
#  index_routines_on_brand_id      (brand_id)
#  index_routines_on_discarded_at  (discarded_at)
#  index_routines_on_slug          (slug) UNIQUE
#  index_routines_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class RoutineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
