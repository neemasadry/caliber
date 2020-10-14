# == Schema Information
#
# Table name: pete_and_pedro_products
#
#  id                 :bigint           not null, primary key
#  body_part_name     :string
#  brand_identifier   :string           not null
#  category_name      :string
#  product_attributes :jsonb            not null
#  product_name       :string           not null
#  product_url        :string           not null
#  subcategory_name   :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class PeteAndPedroProduct < ApplicationRecord

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
