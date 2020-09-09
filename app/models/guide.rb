# == Schema Information
#
# Table name: guides
#
#  id                      :bigint           not null, primary key
#  cached_votes_down       :integer          default(0)
#  cached_votes_score      :integer          default(0)
#  cached_votes_total      :integer          default(0)
#  cached_votes_up         :integer          default(0)
#  cached_weighted_average :float            default(0.0)
#  cached_weighted_score   :integer          default(0)
#  cached_weighted_total   :integer          default(0)
#  discarded_at            :datetime
#  favoritable_score       :text
#  favoritable_total       :text
#  slug                    :string
#  title                   :string(80)       not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  account_id              :bigint           not null
#  brand_id                :bigint
#  user_id                 :bigint           not null
#
# Indexes
#
#  index_guides_on_account_id    (account_id)
#  index_guides_on_brand_id      (brand_id)
#  index_guides_on_discarded_at  (discarded_at)
#  index_guides_on_slug          (slug) UNIQUE
#  index_guides_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (user_id => users.id)
#
class Guide < ApplicationRecord
  extend FriendlyId
  extend Pagy::Search
  include Discard::Model

  belongs_to :user
  belongs_to :account
  belongs_to :brand, optional: true

  has_rich_text :body
  has_one_attached :cover_image
  #has_many :sources, inverse_of: :guide
  has_many :comments, as: :commentable, dependent: :destroy

  #accepts_nested_attributes_for :sources, allow_destroy: true, reject_if: :all_blank

  friendly_id :title, use: :slugged
  #has_paper_trail on: [:create, :update, :destroy]
  #has_drafts # gem 'drafting'
  # has_ancestry
  acts_as_votable
  acts_as_favoritable
  acts_as_taggable_on :tags

  searchkick word_start: [:title], word_middle: [:title]

  before_destroy :destroy_notifications

  validates :title, presence: true, length: { minimum: 10, maximum: 80 }
  validates :body, presence: true, length: { minimum: 300, maximum: 12000 }
  # validates :category, presence: true, length: { minimum: 3, maximum: 20 }
  # validates :subcategory_one, presence: true, length: { minimum: 1, maximum: 20 }
  # validates :subcategory_two, presence: false, length: { maximum: 25 }

  def notifications
    # Exact match
    @notifications ||= Notification.where(params: { review: self })

    # Or Postgres syntax to query the post key in the JSON column
    # @notifications ||= Notification.where("params->'post' = ?", Noticed::Coder.dump(self).to_json)
  end

  def destroy_notifications
    notifications.destroy_all
  end

  def search_data
    {
      title: title
    }
  end

end
