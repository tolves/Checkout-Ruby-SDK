require 'cgi'

# https://developer.paypal.com/docs/api/tracking/v1/#trackers-batch
module PayPalCheckoutSdk
  module Trackers
    class TrackersUpdateRequest
      attr_accessor :path, :body, :headers, :verb

      # PUT /v1/shipping/trackers/{id} won't work, fuck
      def initialize
        @headers = {}
        @body = nil
        @verb = "POST"
        @path = "/v1/shipping/trackers-batch"
        @headers["Content-Type"] = "application/json"
      end
      # body format:
      #   {
      #     trackers:
      #     [
      #       {
      #         transaction_id: "transaction_id",
      #         tracking_number: "tracking_number",
      #         status: "SHIPPED",
      #         carrier: "carrier"
      #       }
      #     ]
      #   }
      def request_body(body)
        @body = body
      end

    end
  end
end