# == Schema Information
#
# Table name: fragrances
#
#  id                      :bigint           not null, primary key
#  accords                 :string(150)
#  base_notes              :string(150)
#  cached_votes_down       :integer          default(0)
#  cached_votes_score      :integer          default(0)
#  cached_votes_total      :integer          default(0)
#  cached_votes_up         :integer          default(0)
#  cached_weighted_average :float            default(0.0)
#  cached_weighted_score   :integer          default(0)
#  cached_weighted_total   :integer          default(0)
#  description             :text             not null
#  gender                  :string(6)        not null
#  ingredients             :text
#  middle_notes            :string(150)
#  name                    :string(100)      not null
#  product_image_data      :text             not null
#  product_url             :text
#  release_date            :date
#  retail_price            :decimal(10, 2)   not null
#  slug                    :string
#  top_notes               :string(150)
#  type_of                 :string(80)       not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  brand_id                :bigint           not null
#  user_id                 :bigint           not null
#
# Indexes
#
#  index_fragrances_on_brand_id  (brand_id)
#  index_fragrances_on_slug      (slug) UNIQUE
#  index_fragrances_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class FragranceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
