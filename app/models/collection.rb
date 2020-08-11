# == Schema Information
#
# Table name: collections
#
#  id              :bigint           not null, primary key
#  collection_type :string(30)       not null
#  total_items     :integer          default(0), not null
#  total_price     :decimal(10, 2)   default(0.0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_collections_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Collection < ApplicationRecord
  belongs_to :user
  has_many :collection_items, dependent: :destroy

  has_many :accessories, through: :collectable_items
  has_many :bottoms, through: :collectable_items
  has_many :cosmetics, through: :collectable_items
  has_many :dresses, through: :collectable_items
  has_many :fragrances, through: :collectable_items
  has_many :jewelries, through: :collectable_items
  has_many :shoes, through: :collectable_items
  has_many :tops, through: :collectable_items

  validates :collection_type, presence: true, length: { maximum: 30 }
  validates :total_items, allow_blank: true, numericality: { integer_only: true, greater_than_or_equal_to: 0 }
  validates :total_price, allow_blank: true, numericality: { integer_only: false, greater_than_or_equal_to: 0.0 }

  # Scopes
  # cd = collectable_type
  scope :group_present?, ->(user, ct) { where(collection_type: ct, user_id: user.id).present? }
  scope :group_object, ->(user, ct) { where(collection_type: ct, user_id: user.id) }
end
