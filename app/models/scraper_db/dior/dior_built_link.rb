class DiorBuiltLink < ApplicationRecord

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
  validates :product_url, presence: true, uniqueness: { scope: :scraper_brand_id }, length: { minimum: 5, maximum: 10000 }

end
