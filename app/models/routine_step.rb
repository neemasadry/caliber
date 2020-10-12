# == Schema Information
#
# Table name: routine_steps
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  est_time    :time
#  name        :string(125)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :bigint
#  routine_id  :bigint           not null
#
# Indexes
#
#  index_routine_steps_on_product_id  (product_id)
#  index_routine_steps_on_routine_id  (routine_id)
#
class RoutineStep < ApplicationRecord
  belongs_to :routine
  belongs_to :product, optional: true

=begin
  # Update total_number_of_products and total_price after RoutineStep created
  after_create do |routine_step|

  end

  # Update total_number_of_products and total_price after RoutineStep destroyed
  after_destroy do |routine_step|

  end
=end
end
