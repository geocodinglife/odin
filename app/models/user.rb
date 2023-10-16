class User < ApplicationRecord
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

  def valid_auth_code?(salt, code)
    # 5mins validity
    totp(salt).verify(code, drift_behind: 300).present?
  end

  private

  # This is used as a secret for this user to
  # generate their OTPs, keep it private.
  def generate_auth_secret
    self.auth_secret = ROTP::Base32.random(16)
  end

  def totp(salt)
    ROTP::TOTP.new(auth_secret + salt, issuer: "YourAppName")
  end
end
