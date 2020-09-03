# == Schema Information
#
# Table name: outfit_item_body_part_items
#
#  id             :bigint           not null, primary key
#  body_part_id   :bigint           not null
#  outfit_item_id :bigint           not null
#
# Indexes
#
#  index_outfit_item_body_part_items_on_body_part_id    (body_part_id)
#  index_outfit_item_body_part_items_on_outfit_item_id  (outfit_item_id)
#
# Foreign Keys
#
#  fk_rails_...  (body_part_id => body_parts.id)
#  fk_rails_...  (outfit_item_id => outfit_items.id)
#
class OutfitItemBodyPartItem < ApplicationRecord
  belongs_to :outfit_item
  belongs_to :body_part

  # Check to see that Outfit has corrent number of body_parts
  # before_create do |new_outfit_item|
  #   new_outfit_item.outfit_item.outfit.outfit_items.each do |check_outfit_item|
  #     check_outfit_item.

  #   end
  # end
end
