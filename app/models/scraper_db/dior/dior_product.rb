# == Schema Information
#
# Table name: dior_products
#
#  id                   :bigint           not null, primary key
#  body_part            :string
#  category             :string
#  clothing_attributes  :jsonb            not null
#  cosmetic_attributes  :jsonb            not null
#  description          :text             not null
#  fragrance_attributes :jsonb            not null
#  gender               :integer          not null
#  name                 :string(200)      not null
#  product_attributes   :jsonb            not null
#  product_url          :text
#  retail_price         :decimal(10, 2)   not null
#  subcategory          :string
#  type_of              :string(50)       not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  scraper_brand_id     :bigint           not null
#
# Indexes
#
#  index_dior_products_on_scraper_brand_id  (scraper_brand_id)
#
class DiorProduct < ApplicationRecord

  connects_to database: { writing: :scraper, reading: :scraper }

  extend Pagy::Search

  belongs_to :scraper_brand

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
  # Begin: Categorization
  has_many :scraper_product_body_part_items, dependent: :destroy #, as: :productable
  has_many :scraper_body_parts, through: :product_body_part_items #, as: :productable

  has_many :scraper_product_category_items, dependent: :destroy #, as: :productable
  has_many :scraper_categories, through: :product_category_items #, as: :productable

  has_many :scraper_product_subcategory_items, dependent: :destroy #, as: :productable
  has_many :scraper_subcategories, through: :product_subcategory_items #, as: :productable
  # End: Categorization
=end

  has_many_attached :images

  searchkick word_start: [:name, :scraper_brand], word_middle: [:name, :scraper_brand], text_middle: [:product_url]

  validates :name, presence: true, uniqueness: { scope: :scraper_brand_id, case_sensitive: false, message: "cannot create multiple entries for the same product." }, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 3000 }
  validates :retail_price, presence: true, numericality: { greater_than: 0, less_than: 1000000 }
  validates :type_of, presence: true, inclusion: { in: ["Accessory", "Bottom", "Cosmetic", "Dress", "Fragrance", "Jewelry", "Shoe", "Suit", "Top"] }
  validates :gender, presence: true, numericality: { in: 1..3 }
  validates :product_url, presence: true, uniqueness: { scope: :scraper_brand_id, message: "cannot create multiple entries for the same product." }

  def search_data
    {
      name: name,
      brand: scraper_brand.name,
      product_url: product_url
    }
  end

end
