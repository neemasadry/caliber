# == Schema Information
#
# Table name: brands
#
#  id              :bigint           not null, primary key
#  about           :text             not null
#  address1        :string(100)      not null
#  address2        :string(100)
#  alias           :string(50)       not null
#  brand_logo_data :jsonb
#  category        :string(100)      not null
#  city            :string(100)      not null
#  country_code    :string(5)        not null
#  email           :string(100)      not null
#  facebook_link   :text
#  founding_date   :date             not null
#  homepage_link   :text
#  instagram_link  :text
#  mission         :string(125)      not null
#  name            :string(150)      not null
#  phone           :string(20)
#  pinterest_link  :text
#  price_range     :integer          not null
#  slug            :string
#  snapchat_link   :text
#  state_code      :string(5)        not null
#  story           :text             not null
#  tiktok_link     :text
#  twitter_link    :text
#  youtube_link    :text
#  zipcode         :string(15)       not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  account_id      :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_brands_on_account_id  (account_id)
#  index_brands_on_alias       (alias) UNIQUE
#  index_brands_on_name        (name)
#  index_brands_on_slug        (slug) UNIQUE
#  index_brands_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (user_id => users.id)
#
class Brand < ApplicationRecord
  extend FriendlyId
  include BrandLogoUploader::Attachment(:brand_logo)
  # include ActiveModel::Validations
  # include Discard::Model

  belongs_to :account
  belongs_to :user

  has_many :comments, as: :commentable
  has_many :statuses, dependent: :destroy

  friendly_id :alias, use: :slugged
  acts_as_favoritor
  has_paper_trail

  ### VALIDATIONS ###
  # Basic Info
  validates :name, presence: true, length: { minimum: 2, maximum: 80 }
  validates :alias, presence: true, uniqueness: true, length: { minimum: 2, maximum: 50 }
  validates :founding_date, presence: true
  validates :mission, presence: true, length: { minimum: 7, maximum: 125 }
  validates :category, presence: true
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
end
