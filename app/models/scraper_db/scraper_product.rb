# == Schema Information
#
# Table name: scraper_products
#
#  id                      :bigint           not null, primary key
#  account_name            :string           not null
#  brand_identifier        :string           not null
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
#  discarded_at            :datetime
#  favoritable_score       :text
#  favoritable_total       :text
#  fragrance_attributes    :jsonb            not null
#  gender                  :integer          not null
#  name                    :string(200)      not null
#  product_url             :text
#  retail_price            :decimal(10, 2)   not null
#  slug                    :string
#  type_of                 :string(50)       not null
#  username                :string           not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
# Indexes
#
#  index_scraper_products_on_discarded_at  (discarded_at)
#  index_scraper_products_on_slug          (slug) UNIQUE
#
class ScraperProduct < ApplicationRecord

  connects_to database: { writing: :scraper, reading: :scraper }

  extend Pagy::Search

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

  # Begin: Categorization
  has_many :product_body_part_items, dependent: :destroy #, as: :productable
  has_many :body_parts, through: :product_body_part_items #, as: :productable

  has_many :product_category_items, dependent: :destroy #, as: :productable
  has_many :categories, through: :product_category_items #, as: :productable

  has_many :product_subcategory_items, dependent: :destroy #, as: :productable
  has_many :subcategories, through: :product_subcategory_items #, as: :productable
  # End: Categorization

  has_many_attached :scraped_images

  searchkick word_start: [:name, :brand], word_middle: [:name, :brand], text_middle: [:product_url]

  validates :name, presence: true, uniqueness: { scope: :brand_identifier, case_sensitive: false, message: "cannot create multiple entries for the same product." }, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 3000 }
  validates :retail_price, presence: true, numericality: { greater_than: 0, less_than: 1000000 }
  validates :type_of, presence: true, inclusion: { in: ["Accessory", "Bottom", "Cosmetic", "Dress", "Fragrance", "Jewelry", "Shoe", "Suit", "Top"] }
  validates :gender, presence: true, numericality: { in: 1..3 }
  validates :product_url, presence: true, uniqueness: { scope: :brand_identifier, message: "cannot create multiple entries for the same product." }

  def search_data
    {
      name: name,
      brand: brand.name,
      product_url: product_url
    }
  end

end
