# == Schema Information
#
# Table name: reviews
#
#  id                      :bigint           not null, primary key
#  cached_votes_down       :integer          default(0)
#  cached_votes_score      :integer          default(0)
#  cached_votes_total      :integer          default(0)
#  cached_votes_up         :integer          default(0)
#  cached_weighted_average :float            default(0.0)
#  cached_weighted_score   :integer          default(0)
#  cached_weighted_total   :integer          default(0)
#  compliment              :integer          default(0), not null
#  discarded_at            :datetime
#  favoritable_score       :text
#  favoritable_total       :text
#  quality                 :integer          default(0), not null
#  ratings                 :jsonb            not null
#  slug                    :string
#  title                   :string(100)      not null
#  value                   :integer          default(0), not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  account_id              :bigint           not null
#  product_id              :bigint           not null
#  user_id                 :bigint           not null
#
# Indexes
#
#  index_reviews_on_account_id    (account_id)
#  index_reviews_on_discarded_at  (discarded_at)
#  index_reviews_on_product_id    (product_id)
#  index_reviews_on_slug          (slug) UNIQUE
#  index_reviews_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
class Review < ApplicationRecord
  extend FriendlyId

  belongs_to :user
  belongs_to :account
  belongs_to :product
  # belongs_to :reviewable, polymorphic: true

  has_many :comments, as: :commentable, dependent: :destroy

  # Categorization
  has_many :review_categories
  has_many :categories, through: :review_categories
  has_many :review_subcategories
  has_many :subcategories, through: :review_subcategories


  has_rich_text :body

  jsonb_accessor(:ratings,
    fragrance_scent: [:integer, default: 0],
    fragrance_longevity: [:integer, default: 0],
    fragrance_sillage: [:integer, default: 0],
    fragrance_presentation: [:integer, default: 0],
    fragrance_versatility: [:integer, default: 0],
    fragrance_uniqueness: [:integer, default: 0],
    shoe_adjustability: [:integer, default: 0],
    shoe_durability: [:integer, default: 0],
    shoe_comfort: [:integer, default: 0],
    shoe_support: [:integer, default: 0],
    shoe_design: [:integer, default: 0],
    shoe_uniqueness: [:integer, default: 0],
    accessory_durability: [:integer, default: 0],
    accessory_comfort: [:integer, default: 0],
    accessory_design: [:integer, default: 0],
    accessory_uniqueness: [:integer, default: 0]
  )

  #has_many :comments, as: :commentable, dependent: :destroy

  searchkick word_start: [:title], word_middle: [:title]

  friendly_id :title, use: :slugged

  # has_ancestry
  acts_as_favoritable
  acts_as_votable

  before_destroy :destroy_notifications

  # Review validations
  validates :title, presence: true, length: { minimum: 5, maximum: 80 }
  validates :body, presence: true, length: { minimum: 50, maximum: 5000 }
  validates :quality, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  validates :value, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  validates :compliment, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 4 }

  # JSONB validations
  #validates :fragrance_scent, :fragrance_longevity, :fragrance_sillage, :fragrance_presentation, :fragrance_versatility, :fragrance_uniqueness, presence: true, numericality: { in: 1..10 }, if: :is_fragrance?
  #validates :shoe_adjustability, :shoe_durability, :shoe_comfort, :shoe_support, :shoe_design, :shoe_uniqueness, presence: true, numericality: { in: 1..10 }, if: :is_shoe?
  validates :accessory_durability, :accessory_comfort, :accessory_design, :accessory_uniqueness, presence: true, numericality: { in: 1..10 }, if: :is_accessory?

  def notifications
    # Exact match
    @notifications ||= Notification.where(params: { review: self })

    # Or Postgres syntax to query the post key in the JSON column
    # @notifications ||= Notification.where("params->'post' = ?", Noticed::Coder.dump(self).to_json)
  end

  def destroy_notifications
    notifications.destroy_all
  end

  def search_data
    {
      title: title
    }
  end

  def is_accessory?
    return true if self.reviewable_type == "Accessory"
    false
  end

  def is_fragrance?
    return true if self.reviewable_type == "Fragrance"
    false
  end

  def is_shoe?
    return true if self.reviewable_type == "Shoe"
    false
  end

  def is_cosmetic?
    return true if self.reviewable_type == "Cosmetic"
    false
  end

  def is_top?
    return true if self.reviewable_type == "Top"
    false
  end

  def is_bottom?
    return true if self.reviewable_type == "Bottom"
    false
  end

  def is_dress?
    return true if self.reviewable_type == "Dress"
    false
  end

  def is_jewelry?
    return true if self.reviewable_type == "Jewelry"
    false
  end

end
