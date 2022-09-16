require 'rails_helper'

RSpec.describe 'The customer subscription API' do
  xit 'can return all custoemr subscriptions, active or otherwise' do
    customer = create(:customer)
    tea = create(:tea)
    subscription1 = create(:subscription)
    subscription2 = create(:subscription)
    CustomerSubscription.create(customer_id: customer.id, subscription_id: subscription1.id, status: true)
    CustomerSubscription.create(customer_id: customer.id, subscription_id: subscription2.id, status: false)

    params = {
      customer_id: customer.id,
      tea_id: tea.id
    }

    headers = { 'CONTENT_TYPE' => 'application/json' }
    get '/api/v1/customer_subscriptions', headers: headers, params: JSON.generate(params)

    response_body = JSON.parse(response.body, symbolize_names: true)

    cust_subs = response_body[:data]
    expect(cust_subs).to have_key(:id)
    expect(cust_subs).to have_key(:attributes)
    expect(cust_subs[:attributes][:active_subscriptions]).to eq([
                                                                  {
                                                                    "title": subscription1.title,
                                                                    "price": subscription1.price,
                                                                    "frequency": subscription1.frequency
                                                                  }
                                                                ])
    expect(cust_subs[:attributes][:inactive_subscriptions]).to eq([
                                                                    {
                                                                      "title": subscription2.title,
                                                                      "price": subscription2.price,
                                                                      "frequency": subscription2.frequency
                                                                    }
                                                                  ])
  end
end
