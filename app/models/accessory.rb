# == Schema Information
#
# Table name: accessories
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
#  description             :text             not null
#  favoritable_score       :text
#  favoritable_total       :text
#  gender                  :string(6)        not null
#  materials               :text
#  name                    :string(100)      not null
#  primary_color           :string(30)       not null
#  product_url             :text
#  retail_price            :decimal(10, 2)   not null
#  secondary_color         :string(30)
#  slug                    :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  account_id              :bigint           not null
#  body_part_group_id      :bigint           not null
#  body_part_id            :bigint           not null
#  brand_id                :bigint           not null
#  category_group_id       :bigint           not null
#  category_id             :bigint           not null
#  subcategory_id          :bigint           not null
#  user_id                 :bigint           not null
#
# Indexes
#
#  index_accessories_on_account_id          (account_id)
#  index_accessories_on_ancestry            (ancestry)
#  index_accessories_on_body_part_group_id  (body_part_group_id)
#  index_accessories_on_body_part_id        (body_part_id)
#  index_accessories_on_brand_id            (brand_id)
#  index_accessories_on_category_group_id   (category_group_id)
#  index_accessories_on_category_id         (category_id)
#  index_accessories_on_slug                (slug) UNIQUE
#  index_accessories_on_subcategory_id      (subcategory_id)
#  index_accessories_on_user_id             (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (user_id => users.id)
#
class Accessory < ApplicationRecord
  # Products (under models/concerns) contains everything that all product categories share
  include Products

  public

    def self.review_ratings
      [
        :accessory_durability,
        :accessory_comfort,
        :accessory_design,
        :accessory_uniqueness
      ]
    end
end
