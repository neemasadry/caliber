# == Schema Information
#
# Table name: built_links
#
#  id              :bigint           not null, primary key
#  link_attributes :jsonb            not null
#  product_name    :string           not null
#  product_url     :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  body_part_id    :bigint           not null
#  brand_id        :bigint           not null
#  category_id     :bigint           not null
#  subcategory_id  :bigint           not null
#
# Indexes
#
#  index_built_links_on_body_part_id    (body_part_id)
#  index_built_links_on_brand_id        (brand_id)
#  index_built_links_on_category_id     (category_id)
#  index_built_links_on_subcategory_id  (subcategory_id)
#
# Foreign Keys
#
#  fk_rails_...  (body_part_id => body_parts.id)
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (subcategory_id => subcategories.id)
#
class BuiltLink < ApplicationRecord
  belongs_to :brand

  jsonb_accessor(:link_attributes,
    first: [:string],
    second: [:string],
    third: [:string],
    fourth: [:string],
    fifth: [:string],
    sixth: [:string],
    seventh: [:string],
    eigth: [:string],
    ninth: [:string],
  )

  validates :product_name, presence: true, uniqueness: { scope: :brand_id }, length: { maximum: 100 }
  validates :product_url, presence: true, uniqueness: { scope: :brand_id }, length: {minimum: 5, maximum: 10000}
end
