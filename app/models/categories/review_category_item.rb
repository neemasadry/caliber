# == Schema Information
#
# Table name: review_category_items
#
#  id          :bigint           not null, primary key
#  category_id :bigint
#  review_id   :bigint
#
# Indexes
#
#  index_review_category_items_on_category_id  (category_id)
#  index_review_category_items_on_review_id    (review_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (review_id => reviews.id)
#
class ReviewCategoryItem < ApplicationRecord
  belongs_to :review
  belongs_to :category

  # has_ancestry
end
