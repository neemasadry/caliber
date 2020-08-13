# == Schema Information
#
# Table name: outfit_items
#
#  id               :bigint           not null, primary key
#  body_part        :string(50)       not null
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

  validates :body_part, presence: true, length: { minimum: 1, maximum: 50 }

  validates :productable_type, presence: true
  validates :productable_id, presence: true, uniqueness: { scope: :productable_type }
  validates :body_part, presence: true
end
