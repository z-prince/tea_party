module Api
  module V1
    class CustomerSubscriptionsController < ApplicationController
      def index
        customer = Customer.find_by(id: cust_subs_params[:customer_id])
        render json: SubscriptionSerializer.format_subscription_info(customer)
      end

      private

      def cust_subs_params
        JSON.parse(request.raw_post, symbolize_names: true)
      end
    end
  end
end
