# == Schema Information
#
# Table name: routine_categories
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  routine_id  :bigint           not null
#
# Indexes
#
#  index_routine_categories_on_category_id  (category_id)
#  index_routine_categories_on_routine_id   (routine_id)
#
class RoutineCategory < ApplicationRecord
end
