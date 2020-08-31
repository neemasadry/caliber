# == Schema Information
#
# Table name: outfit_item_subcategories
#
#  id              :bigint           not null, primary key
#  outfit_items_id :bigint
#  subcategory_id  :bigint
#
# Indexes
#
#  index_outfit_item_subcategories_on_outfit_items_id  (outfit_items_id)
#  index_outfit_item_subcategories_on_subcategory_id   (subcategory_id)
#
# Foreign Keys
#
#  fk_rails_...  (outfit_items_id => outfit_items.id)
#  fk_rails_...  (subcategory_id => subcategories.id)
#
class OutfitItemSubcategoryItem < ApplicationRecord
  belongs_to :outfit_item
  belongs_to :subcategory

  has_ancestry
end
