# == Schema Information
#
# Table name: product_images
#
#  id                     :bigint           not null, primary key
#  product_image_data     :text             not null
#  product_imageable_type :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  brand_id               :bigint           not null
#  product_imageable_id   :bigint           not null
#  user_id                :bigint           not null
#
# Indexes
#
#  index_for_product_imageable       (product_imageable_type,product_imageable_id)
#  index_product_images_on_brand_id  (brand_id)
#  index_product_images_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (user_id => users.id)
#
class ProductImage < ApplicationRecord
  include ProductImageUploader::Attachment(:product_image)

  belongs_to :product_imageable, polymorphic: true
  belongs_to :user
  belongs_to :brand


end
