# == Schema Information
#
# Table name: body_part_groups
#
#  id               :bigint           not null, primary key
#  body_parts_count :integer          default(0), not null
#  name             :string(75)       not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_body_part_groups_on_name  (name) UNIQUE
#
class BodyPartGroup < ApplicationRecord
  has_many :body_parts, dependent: :destroy

  searchkick word_start: [:name], word_middle: [:name]

  def search_data
    {
      name: name
    }
  end
end
