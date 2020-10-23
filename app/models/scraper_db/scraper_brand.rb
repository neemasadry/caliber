# == Schema Information
#
# Table name: scraper_brands
#
#  id               :bigint           not null, primary key
#  about            :text             not null
#  address1         :string(100)      not null
#  address2         :string(100)
#  brand_identifier :string(60)       not null
#  city             :string(100)      not null
#  claimed          :boolean          default(FALSE), not null
#  country_code     :string(5)        not null
#  discarded_at     :datetime
#  email            :string(100)      not null
#  facebook_link    :text
#  founding_date    :date             not null
#  homepage_link    :text
#  instagram_link   :text
#  mission          :string(125)      not null
#  name             :string(150)      not null
#  phone            :string(20)
#  pinterest_link   :text
#  price_range      :integer          not null
#  slug             :string
#  snapchat_link    :text
#  state_code       :string(5)        not null
#  story            :text             not null
#  tiktok_link      :text
#  twitter_link     :text
#  youtube_link     :text
#  zipcode          :string(15)       not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  account_id       :string(150)      not null
#  user_id          :string(150)      not null
#
# Indexes
#
#  index_scraper_brands_on_account_id        (account_id)
#  index_scraper_brands_on_brand_identifier  (brand_identifier) UNIQUE
#  index_scraper_brands_on_discarded_at      (discarded_at)
#  index_scraper_brands_on_name              (name)
#  index_scraper_brands_on_slug              (slug) UNIQUE
#  index_scraper_brands_on_user_id           (user_id)
#
class ScraperBrand < ApplicationRecord

  connects_to database: { writing: :scraper, reading: :scraper }

  extend FriendlyId
  extend Pagy::Search
  # include ActiveModel::Validations
  include Discard::Model

  # belongs_to :scraper_account
  # belongs_to :scraper_user

  has_many :scraper_products, dependent: :destroy
  has_one_attached :logo

=begin
  # Categorization
  has_many :scraper_brand_category_items, dependent: :destroy
  has_many :scraper_categories, through: :brand_category_items
  has_many :scraper_brand_subcategory_items, dependent: :destroy
  has_many :scraper_subcategories, through: :brand_subcategory_items

  # has_many :comments, as: :commentable
  # has_many :posts, dependent: :destroy
  # has_many :outfits
=end

  friendly_id :slug_candidates, use: :slugged

  # acts_as_favoritor
  # acts_as_favoritable
  # acts_as_votable
  has_paper_trail

  searchkick word_start: [:name, :brand_identifier], word_middle: [:name, :brand_identifier], text_middle: [:name, :brand_identifier]

  ### VALIDATIONS ###
  # Basic Info
  validates :name, presence: true, length: { minimum: 2, maximum: 80 }
  validates :brand_identifier, presence: true, uniqueness: true, length: { minimum: 2, maximum: 50 }
  validates :founding_date, presence: true
  validates :mission, presence: true, length: { minimum: 7, maximum: 125 }
  # validates :category, presence: true
  validates :price_range, presence: true, numericality: { only_integer: true }

  # About
  validates :about, presence: true, length: { minimum: 50, maximum: 3000 }
  validates :story, allow_blank: true, length: { minimum: 50, maximum: 3000 }

  # Contact
  validates :email, presence: true, uniqueness: true, length: { minimum: 6, maximum: 100 }

  validates :phone,         allow_blank: true, length: { minimum: 4, maximum: 15 }
  validates :address1,      allow_blank: true, length: { minimum: 4, maximum: 50 }
  validates :address2,      allow_blank: true, length: { minimum: 4, maximum: 50 }
  validates :city,          allow_blank: true, length: { minimum: 4, maximum: 50 }
  validates :state_code,    allow_blank: true, length: { in: 2..5 }
  validates :country_code,  allow_blank: true, length: { in: 2..5 }
  validates :zipcode,       allow_blank: true, length: { minimum: 4, maximum: 15 }

  # Links
  validates :homepage_link,  allow_blank: true, length: { minimum: 4, maximum: 150 }
  validates :instagram_link, allow_blank: true, length: { minimum: 4, maximum: 150 }
  validates :youtube_link,   allow_blank: true, length: { minimum: 4, maximum: 150 }
  validates :facebook_link,  allow_blank: true, length: { minimum: 4, maximum: 150 }
  validates :twitter_link,   allow_blank: true, length: { minimum: 4, maximum: 150 }
  validates :snapchat_link,  allow_blank: true, length: { minimum: 4, maximum: 150 }
  validates :tiktok_link,    allow_blank: true, length: { minimum: 4, maximum: 150 }
  validates :pinterest_link, allow_blank: true, length: { minimum: 4, maximum: 150 }

  def slug_candidates
    [
      ["scraper", :name]
    ]
  end

  def search_data
    {
      name: name
    }
  end

end
