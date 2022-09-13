class Subscription < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :price
  validates_presence_of :status
  validates_presence_of :frequency

  has_many :customer_subscriptions
  has_many :customers, through: :customer_subscriptions
end
