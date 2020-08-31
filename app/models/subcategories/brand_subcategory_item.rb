# == Schema Information
#
# Table name: brand_subcategories
#
#  id             :bigint           not null, primary key
#  brand_id       :bigint
#  subcategory_id :bigint
#
# Indexes
#
#  index_brand_subcategories_on_brand_id        (brand_id)
#  index_brand_subcategories_on_subcategory_id  (subcategory_id)
#
# Foreign Keys
#
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (subcategory_id => subcategories.id)
#
class BrandSubcategoryItem < ApplicationRecord
  belongs_to :brand
  belongs_to :subcategory

  has_ancestry
end
