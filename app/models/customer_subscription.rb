class CustomerSubscription < ApplicationRecord
  validates_presence_of :customer_id
  validates_presence_of :subscription_id
  # validates_presence_of :status, inclusion: { in: [true, false] }

  belongs_to :customer
  belongs_to :subscription

  def self.find_cust_sub(customer_id, sub_id)
    where(customer_id: customer_id, subscription_id: sub_id)
  end
end
