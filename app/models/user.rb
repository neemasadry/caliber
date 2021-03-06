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
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_invitation_token      (invitation_token) UNIQUE
#  index_users_on_invitations_count     (invitations_count)
#  index_users_on_invited_by            (invited_by_type,invited_by_id)
#  index_users_on_invited_by_id         (invited_by_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord

  # connects_to database: { writing: :primary, reading: :primary }

  extend FriendlyId
  extend Pagy::Search
  include ActionText::Attachable

  after_create :create_collection_groups

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, andle :trackable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :masqueradable, :omniauthable

  include UserAccounts
  include UserAgreements

  has_person_name

  include PgSearch::Model
  pg_search_scope :search_by_full_name, against: [:first_name, :last_name], using: {tsearch: {prefix: true}}

  # ActiveStorage Associations
  has_one_attached :avatar

  # Associations
  has_many :api_tokens, dependent: :destroy
  has_many :connected_accounts, dependent: :destroy
  has_many :notifications, as: :recipient, dependent: :destroy

  has_many :brands
  has_many :reviews, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, as: :commentable
  has_many :collections, dependent: :destroy
  has_many :outfits, dependent: :destroy
  has_many :catalogs, dependent: :destroy


  # We don't need users to confirm their email address on create,
  # just when they change it
  before_create :skip_confirmation!

  ### Begin: APP SPECIFIC ###
  friendly_id :username, use: :slugged
  searchkick word_start: [:username, :first_name, :last_name], word_middle: [:username, :first_name, :last_name]

  # has_ancestry
  acts_as_favoritor
  acts_as_favoritable

  acts_as_voter
  ### End: APP SPECIFIC ###

  # Validations
  validates :first_name, presence: true, length: { in: 2..50 }
  validates :last_name, presence: true, length: { in: 2..50 }
  validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
  validates :gender, presence: true #, inclusion: { in: %w(Male Female) }
  validates :date_of_birth, presence: true
  validates :country_code, presence: true
  validates :time_zone, presence: true
  validates :terms_of_service, acceptance: true

  # Scopes and Methods
  def collected?(product_controller, collectable)
    #self.collections.find_by(collection_type: product_controller.singularize.capitalize).collection_items.find_by(collectable_item: collectable)
    self.collections.find_by(collection_type: collectable.productable_type).collection_items.find_by(collectable_item: collectable)
  end

  def add_to_collection(product_type, collectable)
    c_id = self.collections.find_by(collection_type: product_type)
    c_id.collection_items.create(collectable_item: collectable, collection_id: c_id.id)
  end

  def remove_from_collection(product_type, collectable)
    c_id = self.collections.find_by(collection_type: product_type)
    c_id.collection_items.find_by(collectable_item: collectable, collection_id: c_id.id).destroy
  end

  def create_collection_groups
    collection_groups = [ "Accessory", "Bottom", "Cosmetic", "Dress", "Fragrance", "Jewelry", "Shoe", "Top" ]
    collection_groups.each do |collection_group|
      next if self.gender == "male" && collection_group == "Dress"
      self.collections.find_or_create_by(collection_type: collection_group)
    end
  end

end
