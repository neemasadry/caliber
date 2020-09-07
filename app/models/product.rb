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
class Product < ApplicationRecord
  extend FriendlyId
  belongs_to :productable, polymorphic: true
  belongs_to :user
  belongs_to :account
  belongs_to :brand

  has_one :accessory
  has_one :bottom
  has_one :cosmetic
  has_one :dress
  has_one :fragrance
  has_one :jewelry
  has_one :shoe
  has_one :suit
  has_one :top

  friendly_id :name, use: :slugged

  # has_ancestry
  acts_as_favoritable
  acts_as_votable

  #searchkick word_start: [:name, :brand], word_middle: [:name, :brand]

  accepts_nested_attributes_for :accessory, :bottom, :cosmetic, :dress, :fragrance, :jewelry, :shoe, :suit, :top, allow_destroy: true

  def search_data
    {
      name: name,
      brand: brand.name,
    }
  end

  # Wicked
  # def active?
  #   status == 'active'
  # end

end
