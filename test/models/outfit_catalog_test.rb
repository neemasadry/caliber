# == Schema Information
#
# Table name: outfit_catalogs
#
#  id                      :bigint           not null, primary key
#  cached_votes_down       :integer          default(0)
#  cached_votes_score      :integer          default(0)
#  cached_votes_total      :integer          default(0)
#  cached_votes_up         :integer          default(0)
#  cached_weighted_average :float            default(0.0)
#  cached_weighted_score   :integer          default(0)
#  cached_weighted_total   :integer          default(0)
#  category                :string(150)      not null
#  description             :text             not null
#  discarded_at            :datetime
#  favoritable_score       :text
#  favoritable_total       :text
#  slug                    :string
#  title                   :string(150)      not null
#  total_number_of_outfits :integer          default(0), not null
#  total_price             :decimal(10, 2)   default(0.0), not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  account_id              :bigint           not null
#  brand_id                :bigint           not null
#  user_id                 :bigint           not null
#
# Indexes
#
#  index_outfit_catalogs_on_account_id    (account_id)
#  index_outfit_catalogs_on_brand_id      (brand_id)
#  index_outfit_catalogs_on_discarded_at  (discarded_at)
#  index_outfit_catalogs_on_slug          (slug) UNIQUE
#  index_outfit_catalogs_on_title         (title)
#  index_outfit_catalogs_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class OutfitCatalogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
