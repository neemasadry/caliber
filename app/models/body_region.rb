# == Schema Information
#
# Table name: body_regions
#
#  id                :bigint           not null, primary key
#  body_part_count   :integer          default(0), not null
#  name              :string(150)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  account_id        :bigint           not null
#  category_group_id :bigint           not null
#  user_id           :bigint           not null
#
# Indexes
#
#  index_body_regions_on_account_id         (account_id)
#  index_body_regions_on_category_group_id  (category_group_id)
#  index_body_regions_on_user_id            (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (category_group_id => category_groups.id)
#  fk_rails_...  (user_id => users.id)
#
class BodyRegion < ApplicationRecord
  belongs_to :user
  belongs_to :account
  belongs_to :category_group

  has_many :body_parts, dependent: :destroy

  has_ancestry

  validates :name, presence: true, length: { minimum: 2, maximum: 150 }
end
