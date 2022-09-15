class CustomerSubscription < ApplicationRecord
  validates_presence_of :customer_id
  validates_presence_of :subscription_id

  belongs_to :customer
  belongs_to :subscription
end
