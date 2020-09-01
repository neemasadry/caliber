# == Schema Information
#
# Table name: guide_category_items
#
#  id          :bigint           not null, primary key
#  category_id :bigint
#  guide_id    :bigint
#
# Indexes
#
#  index_guide_category_items_on_category_id  (category_id)
#  index_guide_category_items_on_guide_id     (guide_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (guide_id => guides.id)
#
class GuideCategoryItem < ApplicationRecord
  belongs_to :guide
  belongs_to :category

  # has_ancestry
end
