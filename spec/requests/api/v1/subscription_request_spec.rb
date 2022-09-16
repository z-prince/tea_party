require 'rails_helper'

RSpec.describe 'The subscription API' do
  it 'can subscribe a customer' do
    customer = create(:customer)
    tea = create(:tea)
    subscription = create(:subscription)

    params = {
      customer_id: customer.id,
      tea_id: tea.id,
      subscription_id: subscription.id
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/subscriptions', headers: headers, params: JSON.generate(params)

    expect(response).to be_successful
    expect(customer.active_subscriptions.first.title).to eq(subscription.title)
  end

  it 'can unsubscribe a customer' do
    customer = create(:customer)
    tea = create(:tea)
    subscription = create(:subscription)
    CustomerSubscription.create(customer_id: customer.id, subscription_id: subscription.id, status: true)

    params = {
      customer_id: customer.id,
      subscription_id: subscription.id
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    patch '/api/v1/subscriptions', headers: headers, params: JSON.generate(params)

    expect(response).to be_successful
    expect(customer.active_subscriptions).to eq([])
  end
end
