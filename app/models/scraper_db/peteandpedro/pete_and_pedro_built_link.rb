# == Schema Information
#
# Table name: pete_and_pedro_built_links
#
#  id               :bigint           not null, primary key
#  body_part        :string
#  category         :string
#  gender           :integer
#  link_attributes  :jsonb            not null
#  product_name     :string           not null
#  product_url      :string           not null
#  subcategory      :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  scraper_brand_id :bigint           not null
#
# Indexes
#
#  index_pete_and_pedro_built_links_on_scraper_brand_id  (scraper_brand_id)
#
# Foreign Keys
#
#  fk_rails_...  (scraper_brand_id => scraper_brands.id)
#
class PeteAndPedroBuiltLink < ApplicationRecord

  connects_to database: { writing: :scraper, reading: :scraper }

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

  validates :product_name, presence: true, length: { maximum: 200 }
  validates :product_url, presence: true, uniqueness: { scope: :scraper_brand_id }, length: {minimum: 5, maximum: 10000}

end
