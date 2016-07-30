require 'square_connect'
require 'securerandom'
class Payment
# Assume you have correct values assigned to the following variables:
#   NONCE
#   LOCATION_ID
#   ACCESS_TOKEN
  def initialize(nonce)
    @transaction_api = SquareConnect::TransactionApi.new()
    @location_id = ENV['LOCATION_ID']
    @access_token = ENV['ACCESS_TOKEN']
    @nonce = nonce
    @request_body = {

      :card_nonce => nonce,

      # Monetary amounts are specified in the smallest unit of the applicable currency.
      # This amount is in cents. It's also hard-coded for $1, which is not very useful.
      :amount_money => {
        :amount => 7000,
        :currency => 'USD'
      },

      # Every payment you process for a given business have a unique idempotency key.
      # If you're unsure whether a particular payment succeeded, you can reattempt
      # it with the same idempotency key without worrying about double charging
      # the buyer.
      :idempotency_key => SecureRandom.uuid
    }

    process
  end

  def process
    # The SDK throws an exception if a Connect endpoint responds with anything besides 200 (success).
    # This block catches any exceptions that occur from the request.
    begin
      resp = @transaction_api.charge(@access_token, @location_id, @request_body)
    rescue SquareConnect::ApiError => e
        puts 'Error encountered while charging card:'
        puts e.message
    end
    puts resp
  end
end
