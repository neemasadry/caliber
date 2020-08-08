# == Schema Information
#
# Table name: statuses
#
#  id                      :bigint           not null, primary key
#  cached_votes_down       :integer          default(0)
#  cached_votes_score      :integer          default(0)
#  cached_votes_total      :integer          default(0)
#  cached_votes_up         :integer          default(0)
#  cached_weighted_average :float            default(0.0)
#  cached_weighted_score   :integer          default(0)
#  cached_weighted_total   :integer          default(0)
#  description             :text             not null
#  discarded_at            :datetime
#  slug                    :string
#  status_image_data       :text
#  status_video_data       :text
#  title                   :string(150)      not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  account_id              :bigint           not null
#  brand_id                :bigint
#  user_id                 :bigint           not null
#
# Indexes
#
#  index_statuses_on_account_id    (account_id)
#  index_statuses_on_brand_id      (brand_id)
#  index_statuses_on_discarded_at  (discarded_at)
#  index_statuses_on_slug          (slug) UNIQUE
#  index_statuses_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (user_id => users.id)
#
class Status < ApplicationRecord
  extend FriendlyId
  include StatusImageUploader::Attachment(:status_image)
  include StatusVideoUploader::Attachment(:status_video)
  include Discard::Model

  belongs_to :user
  belongs_to :account
  belongs_to :brand, optional: true

  friendly_id :title, use: :slugged
  acts_as_votable
  #acts_as_favoritable
  acts_as_taggable_on :status_tags

  validates :title, presence: true, length: { minimum: 2, maximum: 150 }
  validates :description, presence: true, length: { minimum: 2, maximum: 5000 }

end
