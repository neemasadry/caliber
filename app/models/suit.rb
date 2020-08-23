class Suit < ApplicationRecord
  belongs_to :user
  belongs_to :account
  belongs_to :brand
  belongs_to :top
  belongs_to :bottom
end
