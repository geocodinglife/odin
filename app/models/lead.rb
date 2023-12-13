class Lead < ApplicationRecord
  belongs_to :product
  belongs_to :user

  require "uri"
  require "net/http"

  def self.send_message_to_seller(user)
    url = URI("https://api103.hablame.co/api/sms/v3/send/priority")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    # need to send the 6 digits, needs to be created.
    request = Net::HTTP::Post.new(url)
    request["Account"] = ENV["HABLAME_ACCOUNT"]
    request["ApiKey"] = ENV["HABLAME_API_KEY"]
    request["Token"] = ENV["HABLAME_TOKEN"]
    request["Content-Type"] = "application/json"
    request["Accept"] = "application/json"
    request.body = "{\n  \"toNumber\": \"#{user.phone}\",\n  \"sms\": \"You got new Lead www.odin.zone/rooms  \",\n  \"flash\": \"0\",\n  \"sc\": \"890202\",\n  \"request_dlvr_rcpt\": \"0\"\n}"

    # this is the correct code to by use in production
    # request.body = "{\n  \"toNumber\": \"57#{seller_phone}\",\n  \"sms\": \"SMS de prueba Hablame\",\n  \"flash\": \"0\",\n  \"sc\": \"890202\",\n  \"request_dlvr_rcpt\": \"0\"\n}"

    response = http.request(request)
    response.read_body
  end
end
