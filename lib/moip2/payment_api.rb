module Moip2
  class PaymentApi

    attr_reader :client

    def initialize(client)
      @client = client
    end

    def create(order_id, payment)
      Resource::Payment.new client.post("/v2/orders/#{order_id}/payments", payment)
    end

    def capture(payment_id)
      Resource::Payment.new client.post("/v2/payments/#{payment_id}/capture", nil)
    end
  end
end
