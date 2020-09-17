# == Schema Information
#
# Table name: built_links
#
#  id          :bigint           not null, primary key
#  category    :string
#  product_url :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  brand_id    :bigint           not null
#
# Indexes
#
#  index_built_links_on_brand_id  (brand_id)
#
# Foreign Keys
#
#  fk_rails_...  (brand_id => brands.id)
#
class BuiltLink < ApplicationRecord
  belongs_to :brand
end
