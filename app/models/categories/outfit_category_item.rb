# == Schema Information
#
# Table name: outfit_category_items
#
#  id          :bigint           not null, primary key
#  category_id :bigint
#  outfit_id   :bigint
#
# Indexes
#
#  index_outfit_category_items_on_category_id  (category_id)
#  index_outfit_category_items_on_outfit_id    (outfit_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (outfit_id => outfits.id)
#
class OutfitCategoryItem < ApplicationRecord
  belongs_to :outfit
  belongs_to :category

  # has_ancestry
end
