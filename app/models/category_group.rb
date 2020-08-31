# == Schema Information
#
# Table name: category_groups
#
#  id                  :bigint           not null, primary key
#  ancestry            :string
#  categories_count    :integer          default(0), not null
#  name                :string(150)      not null
#  subcategories_count :integer          default(0), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_category_groups_on_name  (name) UNIQUE
#
class CategoryGroup < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :subcategories, through: :categories, dependent: :destroy

  #counter_culture [:subcategory], column_name: "subcategories_count"

end
