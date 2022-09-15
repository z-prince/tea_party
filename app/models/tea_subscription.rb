class TeaSubscription < ApplicationRecord
  validates_presence_of :tea_id
  validates_presence_of :subscription_id

  belongs_to :tea
  belongs_to :subscription
end
