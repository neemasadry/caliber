# == Schema Information
#
# Table name: users
#
#  id                      :bigint           not null, primary key
#  accepted_privacy_at     :datetime
#  accepted_terms_at       :datetime
#  admin                   :boolean          default(FALSE)
#  announcements_read_at   :datetime
#  cached_votes_down       :integer          default(0)
#  cached_votes_score      :integer          default(0)
#  cached_votes_total      :integer          default(0)
#  cached_votes_up         :integer          default(0)
#  cached_weighted_average :float            default(0.0)
#  cached_weighted_score   :integer          default(0)
#  cached_weighted_total   :integer          default(0)
#  confirmation_sent_at    :datetime
#  confirmation_token      :string
#  confirmed_at            :datetime
#  country_code            :string           not null
#  current_sign_in_at      :datetime
#  current_sign_in_ip      :string
#  date_of_birth           :date             not null
#  email                   :string           default(""), not null
#  encrypted_password      :string           default(""), not null
#  favoritable_score       :text
#  favoritable_total       :text
#  favoritor_score         :text
#  favoritor_total         :text
#  first_name              :string           not null
#  gender                  :string           not null
#  invitation_accepted_at  :datetime
#  invitation_created_at   :datetime
#  invitation_limit        :integer
#  invitation_sent_at      :datetime
#  invitation_token        :string
#  invitations_count       :integer          default(0)
#  invited_by_type         :string
#  last_name               :string           not null
#  last_sign_in_at         :datetime
#  last_sign_in_ip         :string
#  moderator               :boolean          default(FALSE)
#  preferred_language      :string
#  remember_created_at     :datetime
#  reset_password_sent_at  :datetime
#  reset_password_token    :string
#  sign_in_count           :integer          default(0), not null
#  slug                    :string
#  time_zone               :string           not null
#  unconfirmed_email       :string
#  username                :string           not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  invited_by_id           :bigint
#
# Indexes
#
#  index_users_on_email                              (email) UNIQUE
#  index_users_on_invitation_token                   (invitation_token) UNIQUE
#  index_users_on_invitations_count                  (invitations_count)
#  index_users_on_invited_by_id                      (invited_by_id)
#  index_users_on_invited_by_type_and_invited_by_id  (invited_by_type,invited_by_id)
#  index_users_on_reset_password_token               (reset_password_token) UNIQUE
#

require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user has many accounts" do
    user = users(:one)
    assert_includes user.accounts, accounts(:one)
    assert_includes user.accounts, accounts(:company)
  end

  test "user has a personal account" do
    user = users(:one)
    assert_equal accounts(:one), user.personal_account
  end

  test "can delete user with accounts" do
    assert_difference "User.count", -1 do
      users(:one).destroy
    end
  end
end
