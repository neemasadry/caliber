# == Schema Information
#
# Table name: review_subcategories
#
#  id             :bigint           not null, primary key
#  review_id      :bigint
#  subcategory_id :bigint
#
# Indexes
#
#  index_review_subcategories_on_review_id       (review_id)
#  index_review_subcategories_on_subcategory_id  (subcategory_id)
#
# Foreign Keys
#
#  fk_rails_...  (review_id => reviews.id)
#  fk_rails_...  (subcategory_id => subcategories.id)
#
class ReviewSubcategoryItem < ApplicationRecord
  belongs_to :review
  belongs_to :subcategory

  has_ancestry
end
