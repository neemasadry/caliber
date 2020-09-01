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
#  discarded_at            :datetime
#  favoritable_score       :text
#  favoritable_total       :text
#  gender                  :string(6)        not null
#  ingredients             :text
#  middle_notes            :string(150)
#  name                    :string(100)      not null
#  product_url             :text
#  release_date            :date
#  retail_price            :decimal(10, 2)   not null
#  slug                    :string
#  top_notes               :string(150)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  account_id              :bigint           not null
#  brand_id                :bigint           not null
#  category_id             :bigint           not null
#  subcategory_id          :bigint           not null
#  user_id                 :bigint           not null
#
# Indexes
#
#  index_fragrances_on_account_id      (account_id)
#  index_fragrances_on_brand_id        (brand_id)
#  index_fragrances_on_category_id     (category_id)
#  index_fragrances_on_discarded_at    (discarded_at)
#  index_fragrances_on_slug            (slug) UNIQUE
#  index_fragrances_on_subcategory_id  (subcategory_id)
#  index_fragrances_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (user_id => users.id)
#
class Fragrance < ApplicationRecord
  include Products
end