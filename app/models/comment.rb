# == Schema Information
#
# Table name: comments
#
#  id                      :bigint           not null, primary key
#  body                    :text             not null
#  cached_votes_down       :integer          default(0)
#  cached_votes_score      :integer          default(0)
#  cached_votes_total      :integer          default(0)
#  cached_votes_up         :integer          default(0)
#  cached_weighted_average :float            default(0.0)
#  cached_weighted_score   :integer          default(0)
#  cached_weighted_total   :integer          default(0)
#  commentable_type        :string           not null
#  deleted                 :boolean          default(FALSE), not null
#  discarded_at            :datetime
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  account_id              :bigint           not null
#  brand_id                :bigint
#  commentable_id          :integer          not null
#  parent_id               :integer          default(0), not null
#  user_id                 :bigint           not null
#
# Indexes
#
#  index_comments_on_account_id        (account_id)
#  index_comments_on_brand_id          (brand_id)
#  index_comments_on_commentable_id    (commentable_id)
#  index_comments_on_commentable_type  (commentable_type)
#  index_comments_on_discarded_at      (discarded_at)
#  index_comments_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :account
  belongs_to :brand, optional: true
  belongs_to :commentable, polymorphic: true
  belongs_to :parent, optional: true, class_name: "Comment"

  # has_ancestry
  acts_as_favoritable
  acts_as_votable
  has_paper_trail


  ### Begin: Validations ###
  validates :commentable_type, presence: true, length: { maximum: 15 }
  validates :commentable_id, presence: true, numericality: { only_integer: true }

  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :account_id, presence: true, numericality: { only_integer: true }
  validates :brand_id, allow_blank: true, numericality: { only_integer: true }

  validates :body, presence: true, length: { in: 3..1500 }
  ### End: Validations ###

  def comments
    Comment.where(commentable: commentable, parent_id: id)
  end

  def destroy
    update(deleted: true)
  end

  def deleted?
    commentable.deleted == true
  end
end
