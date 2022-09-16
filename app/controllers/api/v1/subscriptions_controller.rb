module Api
  module V1
    class SubscriptionsController < ApplicationController
      def create
        customer_id = subscription_params[:customer_id]
        subscription_id = subscription_params[:subscription_id]
        tea_id = subscription_params[:tea_id]
        CustomerSubscription.create(customer_id: customer_id, subscription_id: subscription_id, status: true)
        TeaSubscription.create(tea_id: tea_id, subscription_id: subscription_id)
      end

      def update
        # Update instead of delete subscription
        customer_id = subscription_params[:customer_id]
        subscription_id = subscription_params[:subscription_id]
        cust_sub = CustomerSubscription.find_cust_sub(customer_id, subscription_id)
        cust_sub.update(status: false)
      end

      private

      def subscription_params
        JSON.parse(request.raw_post, symbolize_names: true)
      end
    end
  end
end
