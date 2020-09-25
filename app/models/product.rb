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
#  clothing_attributes     :jsonb            not null
#  cosmetic_attributes     :jsonb            not null
#  description             :text             not null
#  favoritable_score       :text
#  favoritable_total       :text
#  fragrance_attributes    :jsonb            not null
#  gender                  :integer          not null
#  name                    :string(100)      not null
#  product_url             :text
#  retail_price            :decimal(10, 2)   not null
#  slug                    :string
#  type_of                 :string(50)       not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  account_id              :bigint           not null
#  brand_id                :bigint           not null
#  user_id                 :bigint           not null
#
# Indexes
#
#  index_products_on_account_id  (account_id)
#  index_products_on_brand_id    (brand_id)
#  index_products_on_slug        (slug) UNIQUE
#  index_products_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (user_id => users.id)
#
class Product < ApplicationRecord
  extend FriendlyId
  extend Pagy::Search
  # belongs_to :productable, polymorphic: true
  belongs_to :user
  belongs_to :account
  belongs_to :brand

  jsonb_accessor(:fragrance_attributes,
    top_notes: [:string],
    middle_notes: [:string],
    base_notes: [:string],
    accords: [:string],
    ingredients: [:text],
  )

  jsonb_accessor(:clothing_attributes,
    materials: [:text],
    primary_color: [:string],
    secondary_color: [:string],
    tertiary_color: [:string]
  )

  jsonb_accessor(:cosmetic_attributes,
    ingredients: [:text],
    allergens: [:text]
  )

=begin
  has_one :accessory, as: :productable, dependent: :destroy
  has_one :bottom, as: :productable, dependent: :destroy
  has_one :cosmetic, as: :productable, dependent: :destroy
  has_one :dress, as: :productable, dependent: :destroy
  has_one :fragrance, as: :productable, dependent: :destroy
  has_one :jewelry, as: :productable, dependent: :destroy
  has_one :shoe, as: :productable, dependent: :destroy
  has_one :suit, as: :productable, dependent: :destroy
  has_one :top, as: :productable, dependent: :destroy
=end

  # Begin: Categorization
  has_many :product_body_part_items, dependent: :destroy #, as: :productable
  has_many :body_parts, through: :product_body_part_items #, as: :productable

  has_many :product_category_items, dependent: :destroy #, as: :productable
  has_many :categories, through: :product_category_items #, as: :productable

  has_many :product_subcategory_items, dependent: :destroy #, as: :productable
  has_many :subcategories, through: :product_subcategory_items #, as: :productable
  # End: Categorization

  has_many :reviews, dependent: :destroy
  has_many :collectable_items
  has_many :collections, through: :collectable_items
  has_many :outfit_items
  has_many :outfits, through: :outfit_items

  has_many_attached :images

  friendly_id :name, use: :slugged

  # has_ancestry
  acts_as_favoritable
  acts_as_votable

  searchkick word_start: [:name, :brand], word_middle: [:name, :brand]

  # accepts_nested_attributes_for :accessory, :bottom, :cosmetic, :dress, :fragrance, :jewelry, :shoe, :suit, :top, allow_destroy: true

  validates :name, presence: true, uniqueness: { scope: :brand_id, case_sensitive: false, message: "cannot create multiple entries for the same product." }, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 3000 }
  validates :retail_price, presence: true, numericality: { greater_than: 0, less_than: 1000000 }
  validates :type_of, presence: true, inclusion: { in: ["Accessory", "Bottom", "Cosmetic", "Dress", "Fragrance", "Jewelry", "Shoe", "Suit", "Top"] }
  validates :gender, presence: true, numericality: { in: 1..3 }
  validates :product_url, presence: true, uniqueness: { scope: :brand_id, message: "cannot create multiple entries for the same product." }

  def search_data
    {
      name: name,
      brand: brand.name,
    }
  end

end
