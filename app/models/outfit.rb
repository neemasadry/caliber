# == Schema Information
#
# Table name: outfits
#
#  id                       :bigint           not null, primary key
#  cached_votes_down        :integer          default(0)
#  cached_votes_score       :integer          default(0)
#  cached_votes_total       :integer          default(0)
#  cached_votes_up          :integer          default(0)
#  cached_weighted_average  :float            default(0.0)
#  cached_weighted_score    :integer          default(0)
#  cached_weighted_total    :integer          default(0)
#  description              :text             not null
#  discarded_at             :datetime
#  dress_code               :string(50)       not null
#  favoritable_score        :text
#  favoritable_total        :text
#  name                     :string(150)      not null
#  occasion                 :string(50)       not null
#  season                   :string(10)       not null
#  slug                     :string
#  total_number_of_products :integer          default(0), not null
#  total_price              :decimal(10, 2)   default(0.0), not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  account_id               :bigint           not null
#  brand_id                 :bigint
#  user_id                  :bigint           not null
#
# Indexes
#
#  index_outfits_on_account_id    (account_id)
#  index_outfits_on_brand_id      (brand_id)
#  index_outfits_on_discarded_at  (discarded_at)
#  index_outfits_on_name          (name)
#  index_outfits_on_slug          (slug) UNIQUE
#  index_outfits_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (user_id => users.id)
#
class Outfit < ApplicationRecord
  extend FriendlyId
  extend Pagy::Search

  belongs_to :user
  belongs_to :account
  belongs_to :brand, optional: true

  has_many :outfit_items, dependent: :destroy

  friendly_id :name, use: :slugged

  acts_as_favoritable
  acts_as_votable

  searchkick word_start: [:name], word_middle: [:name], text_middle: [:occasion, :dress_code]

  # accepts_nested_attributes_for :outfit_items, allow_destroy: true, reject_if: :all_blank

  # validate :require_one_item

  validates :name, presence: true, length: { minimum: 4, maximum: 150 }
  validates :description, presence: true, length: { minimum: 10, maximum: 3000 }
  validates :season, presence: true, length: { minimum: 1, maximum: 10 }
  validates :occasion, presence: true, length: { minimum: 1, maximum: 50 }
  validates :dress_code, presence: true, length: { minimum: 1, maximum: 50 }
  validates :total_number_of_products, allow_blank: true, numericality: { integer_only: true, greater_than_or_equal_to: 0 }
  validates :total_price, allow_blank: true, numericality: { greater_than_or_equal_to: 0.0 }

  def search_data
    {
      name: name,
      occasion: occasion,
      dress_code: dress_code
    }
  end

  # def require_one_item
  #   errors.add(:base, "You must add at least one item to your outfit") if outfit_items.size < 1
  # end

  def reject_conditions
    #proc { |attr| attr['productable_type'].blank? || attr['productable_id'].blank? || attr['body_part'].blank?  }
    if (self.productable_type.blank? || self.productable_id.blank?)
      errors.add(:product, "cannot be blank")
    elsif (self.body_part.blank?)
      errors.add(:body_part, "cannot be blank")
    end

  end

end
