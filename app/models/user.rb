class User < ApplicationRecord
  require "uri"
  require "net/http"

  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :products
  has_many :leads
  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  has_many :messages

  validates :phone, {presence: true, uniqueness: true}
  validates :email, {presence: true, uniqueness: true}
  normalizes :email, with: ->(email) { email.strip.downcase }

  def self.generate_auth_salt
    ROTP::Base32.random(16)
  end

  def auth_code(salt)
    totp(salt).now
  end

  def valid_auth_code?(code, salt)
    totp(salt).verify(code, drift_behind: 300).present?
  end

  def self.send_login_code_message_to_user(user, code)
    url = URI("https://api103.hablame.co/api/sms/v3/send/priority")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(url)
    request["Account"] = ENV["HABLAME_ACCOUNT"]
    request["ApiKey"] = ENV["HABLAME_API_KEY"]
    request["Token"] = ENV["HABLAME_TOKEN"]
    request["Content-Type"] = "application/json"
    request["Accept"] = "application/json"
    request.body = "{\n  \"toNumber\": \"#{user.phone}\",\n  \"sms\": \"#{user.first_name.capitalize} your login code is: #{code} \",\n  \"flash\": \"0\",\n  \"sc\": \"890202\",\n  \"request_dlvr_rcpt\": \"0\"\n}"

    # this is the correct code to by use in production
    # request.body = "{\n  \"toNumber\": \"57#{seller_phone}\",\n  \"sms\": \"SMS de prueba Hablame\",\n  \"flash\": \"0\",\n  \"sc\": \"890202\",\n  \"request_dlvr_rcpt\": \"0\"\n}"

    response = http.request(request)
    response.read_body
  end

  private

  def generate_auth_secret
    self.auth_secret = ROTP::Base32.random(16)
  end

  def totp(salt)
    ROTP::TOTP.new(auth_secret + salt, issuer: first_name)
  end
end
