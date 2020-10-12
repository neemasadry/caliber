# == Schema Information
#
# Table name: scraper_built_links
#
#  id               :bigint           not null, primary key
#  body_part_name   :string
#  brand_identifier :string           not null
#  category_name    :string
#  link_attributes  :jsonb            not null
#  product_name     :string           not null
#  product_url      :string           not null
#  subcategory_name :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class ScraperBuiltLink < ApplicationRecord

  connects_to database: { writing: :scraper, reading: :scraper }

  # belongs_to :brand
  # belongs_to :body_part, optional: true
  # belongs_to :category, optional: true
  # belongs_to :subcategory, optional: true

  jsonb_accessor(:link_attributes,
    first: [:string],
    second: [:string],
    third: [:string],
    fourth: [:string],
    fifth: [:string],
    sixth: [:string],
    seventh: [:string],
    eigth: [:string],
    ninth: [:string],
  )

  validates :product_name, presence: true, uniqueness: { scope: :brand_identifier }, length: { maximum: 200 }
  validates :product_url, presence: true, uniqueness: { scope: :brand_identifier }, length: {minimum: 5, maximum: 10000}
end
