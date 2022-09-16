require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should have_many(:customer_subscriptions) }
    it { should have_many(:subscriptions).through(:customer_subscriptions) }
  end

  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :address }
  end

  describe 'behaviors' do
    it 'can find active subscriptions' do
      customer = create(:customer)
      tea = create(:tea)
      subscription1 = create(:subscription)
      subscription2 = create(:subscription)
      CustomerSubscription.create(customer_id: customer.id, subscription_id: subscription1.id, status: true)
      CustomerSubscription.create(customer_id: customer.id, subscription_id: subscription2.id, status: false)

      expect(customer.active_subscriptions).to eq([subscription1])
    end

    it 'can find inactive subscriptions' do
      customer = create(:customer)
      tea = create(:tea)
      subscription1 = create(:subscription)
      subscription2 = create(:subscription)
      CustomerSubscription.create(customer_id: customer.id, subscription_id: subscription1.id, status: true)
      CustomerSubscription.create(customer_id: customer.id, subscription_id: subscription2.id, status: false)

      expect(customer.inactive_subscriptions).to eq([subscription2])
    end
  end
end
