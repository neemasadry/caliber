# == Schema Information
#
# Table name: collection_items
#
#  id                    :bigint           not null, primary key
#  collectable_item_type :string           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  collectable_item_id   :bigint           not null
#  collection_id         :bigint           not null
#
# Indexes
#
#  index_collection_items_on_collectable_type_and_id  (collectable_item_type,collectable_item_id)
#  index_collection_items_on_collection_id            (collection_id)
#
# Foreign Keys
#
#  fk_rails_...  (collection_id => collections.id)
#
class CollectionItem < ApplicationRecord
  belongs_to :collectable_item, polymorphic: true
  belongs_to :collection

  # has_ancestry

  validates :collectable_item_type, presence: true, length: { maximum: 30 }
  validates :collectable_item_id, presence: true, numericality: { only_integer: true }
  validates :collection_id, presence: true, numericality: { only_integer: true }

  after_create do |collection_item|
    # Update total number of items in associated Collection object
    collection_item.collection.total_items = collection_item.collection.collection_items.where(collection_id: collection_item.collection.id).count

    # Update total price of all the items in associated Collection object
    updated_price = 0.00
    collection_item.collection.collection_items.where(collection_id: collection_item.collection.id).find_each do |item_price_to_update|
      updated_price = updated_price + item_price_to_update.collectable_item.productable.retail_price
    end

    collection_item.collection.total_price = updated_price
    collection_item.collection.save!
  end

  after_destroy do |collection_item|
    collection_item.collection.total_items = 0
    collection_item.collection.total_price = 0.0
    collection_item.collection.save!
  end

  scope :product_in_collection?, ->(user, item) { where(collectable_item: item, collection_id: user.collections.find_by(collection_type: params[:controller].singularize.capitalize).id) }
end
