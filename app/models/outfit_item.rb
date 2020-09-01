# == Schema Information
#
# Table name: outfit_items
#
#  id               :bigint           not null, primary key
#  productable_type :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  outfit_id        :bigint           not null
#  productable_id   :bigint           not null
#
# Indexes
#
#  index_outfit_items_on_outfit_id                            (outfit_id)
#  index_outfit_items_on_productable_type_and_productable_id  (productable_type,productable_id)
#
# Foreign Keys
#
#  fk_rails_...  (outfit_id => outfits.id)
#
class OutfitItem < ApplicationRecord
  belongs_to :outfit
  belongs_to :productable, polymorphic: true

  # Categorization
  has_many :outfit_item_category_items, dependent: :destroy
  has_many :categories, through: :outfit_item_category_items
  has_many :outfit_item_subcategory_items, dependent: :destroy
  has_many :subcategories, through: :outfit_item_subcategory_items

  # has_ancestry

  validates :productable_type, presence: true
  validates :productable_id, presence: true, uniqueness: { scope: [:outfit_id, :productable_type] }
  # validates :body_part, presence: true, length: { minimum: 1, maximum: 50 }, inclusion: { in: ["Crown", "Eyes", "Ears", "Neck", "Arm", "Forearm", "Wrist", "Hands", "Finger", "Back", "Chest", "Abdomen", "Waist", "Legs", "Feet", "Not on Body" ] }
  validates :outfit_id, presence: true

  before_create do |outfit_item|
    all_outfit_items = outfit_item.outfit.outfit_items

    all_outfit_items.each do |present_item|

    end
  end

  after_create do |outfit_item|
    # Update total number of items in associated Outfit object
    outfit_item.outfit.total_number_of_products = outfit_item.outfit.outfit_items.where(outfit_id: outfit_item.outfit.id).count

    # Update total price of all the items in associated Outfit object
    updated_price = 0.00
    outfit_item.outfit.outfit_items.where(outfit_id: outfit_item.outfit.id).find_each do |item_price_to_update|
      updated_price = updated_price + item_price_to_update.productable.retail_price
    end

    outfit_item.outfit.total_price = updated_price
    outfit_item.outfit.save!
  end

  after_destroy do |outfit_item|
    outfit_item.outfit.total_number_of_products = 0
    outfit_item.outfit.total_price = 0.0
    outfit_item.outfit.save!
  end

end
