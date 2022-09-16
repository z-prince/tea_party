require 'rails_helper'

RSpec.describe CustomerSubscription, type: :model do
  describe 'relationships' do
    it { should belong_to(:customer) }
    it { should belong_to(:subscription) }
  end

  describe 'validations' do
    it { should validate_presence_of :customer_id }
    it { should validate_presence_of :subscription_id }
    # it { should validate_presence_of :status }
  end

  describe 'behaviors' do
    it 'can find cust sub relationship' do
      customer = create(:customer)
      tea = create(:tea)
      subscription1 = create(:subscription)
      subscription2 = create(:subscription)
      cs1 = CustomerSubscription.create(customer_id: customer.id, subscription_id: subscription1.id, status: true)
      CustomerSubscription.create(customer_id: customer.id, subscription_id: subscription2.id, status: false)

      expect(CustomerSubscription.find_cust_sub(customer.id, subscription1.id)).to eq([cs1])
    end
  end
end
