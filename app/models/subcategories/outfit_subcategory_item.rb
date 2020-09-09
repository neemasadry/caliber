# == Schema Information
#
# Table name: outfit_subcategory_items
#
#  id             :bigint           not null, primary key
#  outfit_id      :bigint
#  subcategory_id :bigint
#
# Indexes
#
#  index_outfit_subcategory_items_on_outfit_id       (outfit_id)
#  index_outfit_subcategory_items_on_subcategory_id  (subcategory_id)
#
# Foreign Keys
#
#  fk_rails_...  (outfit_id => outfits.id)
#  fk_rails_...  (subcategory_id => subcategories.id)
#
class OutfitSubcategoryItem < ApplicationRecord
  belongs_to :outfit
  belongs_to :subcategory

  # has_ancestry
end
