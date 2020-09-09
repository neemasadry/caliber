# == Schema Information
#
# Table name: products
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
#  name                    :string(100)      not null
#  productable_type        :string           not null
#  slug                    :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  account_id              :bigint           not null
#  brand_id                :bigint           not null
#  productable_id          :bigint           not null
#  user_id                 :bigint           not null
#
# Indexes
#
#  index_products_on_account_id                           (account_id)
#  index_products_on_brand_id                             (brand_id)
#  index_products_on_discarded_at                         (discarded_at)
#  index_products_on_productable_type_and_productable_id  (productable_type,productable_id)
#  index_products_on_slug                                 (slug) UNIQUE
#  index_products_on_user_id                              (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end