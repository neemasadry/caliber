# == Schema Information
#
# Table name: subcategories
#
#  id                :bigint           not null, primary key
#  name              :string(150)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  category_group_id :bigint           not null
#  category_id       :bigint           not null
#
# Indexes
#
#  index_subcategories_on_category_group_id  (category_group_id)
#  index_subcategories_on_category_id        (category_id)
#  index_subcategories_on_name               (name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (category_group_id => category_groups.id)
#  fk_rails_...  (category_id => categories.id)
#
class Subcategory < ApplicationRecord
  belongs_to :category_group
  belongs_to :category

  counter_culture [:category, :category_group]
  counter_culture :category
end
