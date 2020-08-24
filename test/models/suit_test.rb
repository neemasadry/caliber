# == Schema Information
#
# Table name: suits
#
#  id                       :bigint           not null, primary key
#  body_part                :string(50)       not null
#  cached_votes_down        :integer          default(0)
#  cached_votes_score       :integer          default(0)
#  cached_votes_total       :integer          default(0)
#  cached_votes_up          :integer          default(0)
#  cached_weighted_average  :float            default(0.0)
#  cached_weighted_score    :integer          default(0)
#  cached_weighted_total    :integer          default(0)
#  category                 :string(75)       not null
#  description              :text             not null
#  discarded_at             :datetime
#  favoritable_score        :text
#  favoritable_total        :text
#  gender                   :string(6)        not null
#  jacket_breasted_style    :string(75)       not null
#  jacket_lapel_style       :string(75)       not null
#  jacket_number_of_buttons :integer          default(1), not null
#  jacket_pocket_style      :string(75)       not null
#  jacket_sleeve_buttons    :string(75)       not null
#  jacket_ticket_pocket     :boolean          default(FALSE), not null
#  jacket_vents_style       :string(75)       not null
#  materials                :text
#  name                     :string(100)      not null
#  primary_color            :string(30)       not null
#  product_url              :text
#  retail_price             :decimal(10, 2)   not null
#  secondary_color          :string(30)
#  slug                     :string
#  subcategory              :string(75)       not null
#  suit_type                :string(75)       not null
#  trouser_cuff             :string(75)       not null
#  trouser_pleats           :string(75)       not null
#  trouser_waistband_style  :string(75)       not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  account_id               :bigint           not null
#  bottom_id                :bigint           not null
#  brand_id                 :bigint           not null
#  top_id                   :bigint           not null
#  user_id                  :bigint           not null
#
# Indexes
#
#  index_suits_on_account_id    (account_id)
#  index_suits_on_bottom_id     (bottom_id)
#  index_suits_on_brand_id      (brand_id)
#  index_suits_on_discarded_at  (discarded_at)
#  index_suits_on_slug          (slug) UNIQUE
#  index_suits_on_top_id        (top_id)
#  index_suits_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (bottom_id => bottoms.id)
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (top_id => tops.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class SuitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end