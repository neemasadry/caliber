# == Schema Information
#
# Table name: brands
#
#  id              :bigint           not null, primary key
#  about           :text             not null
#  address1        :string(100)      not null
#  address2        :string(100)
#  alias           :string(50)       not null
#  brand_logo_data :jsonb
#  category        :string(100)      not null
#  city            :string(100)      not null
#  country_code    :string(5)        not null
#  email           :string(100)      not null
#  facebook_link   :text
#  founding_date   :date             not null
#  homepage_link   :text
#  instagram_link  :text
#  mission         :string(125)      not null
#  name            :string(150)      not null
#  phone           :string(20)
#  pinterest_link  :text
#  price_range     :integer          not null
#  slug            :string
#  snapchat_link   :text
#  state_code      :string(5)        not null
#  story           :text             not null
#  tiktok_link     :text
#  twitter_link    :text
#  youtube_link    :text
#  zipcode         :string(15)       not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  account_id      :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_brands_on_account_id  (account_id)
#  index_brands_on_alias       (alias) UNIQUE
#  index_brands_on_name        (name)
#  index_brands_on_slug        (slug) UNIQUE
#  index_brands_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class BrandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end