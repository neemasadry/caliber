# == Schema Information
#
# Table name: brand_categories
#
#  id          :bigint           not null, primary key
#  brand_id    :bigint
#  category_id :bigint
#
# Indexes
#
#  index_brand_categories_on_brand_id     (brand_id)
#  index_brand_categories_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (category_id => categories.id)
#
class BrandCategoryItem < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  has_ancestry
end
