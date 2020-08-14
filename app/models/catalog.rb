# == Schema Information
#
# Table name: catalogs
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
#  subcategory             :string(150)      not null
#  title                   :string(150)      not null
#  total_items             :integer          default(0), not null
#  total_price             :decimal(10, 2)   default(0.0), not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  account_id              :bigint           not null
#  brand_id                :bigint
#  user_id                 :bigint           not null
#
# Indexes
#
#  index_catalogs_on_account_id    (account_id)
#  index_catalogs_on_brand_id      (brand_id)
#  index_catalogs_on_discarded_at  (discarded_at)
#  index_catalogs_on_slug          (slug) UNIQUE
#  index_catalogs_on_title         (title)
#  index_catalogs_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (user_id => users.id)
#
class Catalog < ApplicationRecord
  extend FriendlyId

  belongs_to :user
  belongs_to :account
  belongs_to :brand, optional: true

  has_many :catalog_items, as: :catalogable_items, dependent: :destroy

  has_many :outfits, through: :catalogable_items
  has_many :guides, through: :catalogable_items
  has_many :reviews, through: :catalogable_items
  # has_many :recipes, through: :catalogable_items

  friendly_id :title, use: :slugged

  acts_as_favoritable
  acts_as_votable

  searchkick word_start: [:title], word_middle: [:title], text_middle: [:category]

  validates :title, presence: true, length: { minimum: 4, maximum: 150 }
  validates :description, presence: true, length: { minimum: 10, maximum: 3000 }
  validates :occasion, presence: true, length: { minimum: 1, maximum: 50 }
  validates :category, presence: true, length: { minimum: 1, maximum: 150 }
  validates :subcategory, presence: true, length: { minimum: 1, maximum: 150 }
  validates :total_items, allow_blank: true, numericality: { integer_only: true, greater_than_or_equal_to: 0 }
  validates :total_price, allow_blank: true, numericality: { greater_than_or_equal_to: 0.0 }

  def search_data
    {
      title: title,
      category: category
    }
  end
end
