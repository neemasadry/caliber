# == Schema Information
#
# Table name: categories
#
#  id                  :bigint           not null, primary key
#  ancestry            :string
#  name                :string(150)      not null
#  subcategories_count :integer          default(0), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  category_group_id   :bigint           not null
#
# Indexes
#
#  index_categories_on_category_group_id  (category_group_id)
#  index_categories_on_name               (name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (category_group_id => category_groups.id)
#
class Category < ApplicationRecord
  belongs_to :category_group

  has_many :subcategories, dependent: :destroy

  counter_culture :category_group
  #counter_culture :subcategory, column_name: "subcategories_count"
end
