# == Schema Information
#
# Table name: guide_subcategories
#
#  id             :bigint           not null, primary key
#  guide_id       :bigint
#  subcategory_id :bigint
#
# Indexes
#
#  index_guide_subcategories_on_guide_id        (guide_id)
#  index_guide_subcategories_on_subcategory_id  (subcategory_id)
#
# Foreign Keys
#
#  fk_rails_...  (guide_id => guides.id)
#  fk_rails_...  (subcategory_id => subcategories.id)
#
class GuideSubcategoryItem < ApplicationRecord
  belongs_to :guide
  belongs_to :subcategory

  has_ancestry
end
