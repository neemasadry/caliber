# == Schema Information
#
# Table name: subcategories
#
#  id                   :bigint           not null, primary key
#  accessories_count    :integer          default(0), not null
#  ancestry             :string
#  bottoms_count        :integer          default(0), not null
#  brands_count         :integer          default(0), not null
#  catalogs_count       :integer          default(0), not null
#  cosmetics_count      :integer          default(0), not null
#  discarded_at         :datetime
#  dresses_count        :integer          default(0), not null
#  fragrances_count     :integer          default(0), not null
#  guides_count         :integer          default(0), not null
#  jewelries_count      :integer          default(0), not null
#  name                 :string(150)      not null
#  outfits_count        :integer          default(0), not null
#  reviews_count        :integer          default(0), not null
#  shoes_count          :integer          default(0), not null
#  suits_count          :integer          default(0), not null
#  tops_count           :integer          default(0), not null
#  total_products_count :integer          default(0), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  account_id           :bigint           not null
#  category_id          :bigint           not null
#  user_id              :bigint           not null
#
# Indexes
#
#  index_subcategories_on_account_id    (account_id)
#  index_subcategories_on_ancestry      (ancestry)
#  index_subcategories_on_category_id   (category_id)
#  index_subcategories_on_discarded_at  (discarded_at)
#  index_subcategories_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class SubcategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end