class Lead < ApplicationRecord
  belongs_to :product
  belongs_to :user

  require "uri"
  require "net/http"

  def self.send_message_to_seller(phone)
    url = URI("https://api103.hablame.co/api/sms/v3/send/priority")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Account"] = ENV["HABLAME_ACCOUNT"]
    request["ApiKey"] = ENV["HABLAME_API_KEY"]
    request["Token"] = ENV["HABLAME_TOKEN"]
    request["Content-Type"] = "application/json"
    request["Accept"] = "application/json"
    request.body = "{\n  \"toNumber\": \"573203850750\",\n  \"sms\": \"SMS de prueba Hablame\",\n  \"flash\": \"0\",\n  \"sc\": \"890202\",\n  \"request_dlvr_rcpt\": \"0\"\n}"

    # this is the correct code to by use in production
    # request.body = "{\n  \"toNumber\": \"57#{seller_phone}\",\n  \"sms\": \"SMS de prueba Hablame\",\n  \"flash\": \"0\",\n  \"sc\": \"890202\",\n  \"request_dlvr_rcpt\": \"0\"\n}"

    response = http.request(request)
    p "*" * 125
    p response.read_body
    p "*" * 125
  end
end
