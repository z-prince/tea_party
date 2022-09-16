class Customer < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :address

  has_many :customer_subscriptions
  has_many :subscriptions, through: :customer_subscriptions

  def active_subscriptions
    subscriptions.where(customer_subscriptions: { status: true })
  end

  def inactive_subscriptions
    subscriptions.where(customer_subscriptions: { status: false })
  end
end
