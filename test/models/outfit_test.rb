# == Schema Information
#
# Table name: outfits
#
#  id                         :bigint           not null, primary key
#  abdomen_count              :integer          default(0), not null
#  accessories_count          :integer          default(0), not null
#  belts_count                :integer          default(0), not null
#  bodies_group_count         :integer          default(0), not null
#  cached_votes_down          :integer          default(0)
#  cached_votes_score         :integer          default(0)
#  cached_votes_total         :integer          default(0)
#  cached_votes_up            :integer          default(0)
#  cached_weighted_average    :float            default(0.0)
#  cached_weighted_score      :integer          default(0)
#  cached_weighted_total      :integer          default(0)
#  chests_count               :integer          default(0), not null
#  crowns_count               :integer          default(0), not null
#  description                :text             not null
#  discarded_at               :datetime
#  dress_code                 :string(50)       not null
#  ears_count                 :integer          default(0), not null
#  eyes_count                 :integer          default(0), not null
#  favoritable_score          :text
#  favoritable_total          :text
#  feets_count                :integer          default(0), not null
#  feets_group_count          :integer          default(0), not null
#  full_lengths_count         :integer          default(0), not null
#  head_and_necks_group_count :integer          default(0), not null
#  left_arms_count            :integer          default(0), not null
#  left_arms_group_count      :integer          default(0), not null
#  left_baby_fingers_count    :integer          default(0), not null
#  left_forearms_count        :integer          default(0), not null
#  left_hands_count           :integer          default(0), not null
#  left_index_fingers_count   :integer          default(0), not null
#  left_middle_fingers_count  :integer          default(0), not null
#  left_ring_fingers_count    :integer          default(0), not null
#  left_thumbs_count          :integer          default(0), not null
#  left_wrists_count          :integer          default(0), not null
#  legs_group_count           :integer          default(0), not null
#  lower_halves_count         :integer          default(0), not null
#  name                       :string(150)      not null
#  necks_count                :integer          default(0), not null
#  occasion                   :string(50)       not null
#  right_arms_count           :integer          default(0), not null
#  right_arms_group_count     :integer          default(0), not null
#  right_baby_fingers_count   :integer          default(0), not null
#  right_forearms_count       :integer          default(0), not null
#  right_hands_count          :integer          default(0), not null
#  right_index_fingers_count  :integer          default(0), not null
#  right_middle_fingers_count :integer          default(0), not null
#  right_ring_fingers_count   :integer          default(0), not null
#  right_thumbs_count         :integer          default(0), not null
#  right_wrists_count         :integer          default(0), not null
#  season                     :string(10)       not null
#  slug                       :string
#  total_number_of_products   :integer          default(0), not null
#  total_price                :decimal(10, 2)   default(0.0), not null
#  upper_halves_count         :integer          default(0), not null
#  waists_group_count         :integer          default(0), not null
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  account_id                 :bigint           not null
#  brand_id                   :bigint
#  user_id                    :bigint           not null
#
# Indexes
#
#  index_outfits_on_account_id    (account_id)
#  index_outfits_on_brand_id      (brand_id)
#  index_outfits_on_discarded_at  (discarded_at)
#  index_outfits_on_name          (name)
#  index_outfits_on_slug          (slug) UNIQUE
#  index_outfits_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class OutfitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
