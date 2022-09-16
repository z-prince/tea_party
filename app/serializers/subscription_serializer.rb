class SubscriptionSerializer
  def self.format_subscription_info(customer)
    {
      data: {
        id: customer.id,
        type: 'subscriptions',
        attributes: {
          active_subscriptions: customer.active_subscriptions.map do |sub|
            {
              title: sub.title,
              price: sub.price,
              frequency: sub.frequency
            }
          end,

          inactive_subscriptions: customer.inactive_subscriptions.map do |sub|
            {
              title: sub.title,
              price: sub.price,
              frequency: sub.frequency
            }
          end
        }
      }
    }
  end
end
