# == Schema Information
#
# Table name: outfit_item_category_items
#
#  id              :bigint           not null, primary key
#  category_id     :bigint
#  outfit_items_id :bigint
#
# Indexes
#
#  index_outfit_item_category_items_on_category_id      (category_id)
#  index_outfit_item_category_items_on_outfit_items_id  (outfit_items_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (outfit_items_id => outfit_items.id)
#
class OutfitItemCategoryItem < ApplicationRecord
  belongs_to :outfit_item
  belongs_to :category

  # has_ancestry
end
