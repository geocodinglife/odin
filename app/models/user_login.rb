module UserLogin
  module_function

  def start_auth(params)
    salt = User.generate_auth_salt

    user = User.find_or_create_by(email: params[:email]) do |user|
      user.first_name = params[:first_name]
      user.phone = params[:phone]
      user.auth_secret = ROTP::Base32.random(16)
    end

    User.send_login_code_message_to_user(user, user.auth_code(salt))

    salt
  end

  def verify_information(phone, code, salt)
    user = User.find_by(phone: phone)

    if user.blank?
      return UserLoginResponse.new(
        "Oh dear, we could not find an account using that email.
        Contact support@nine.shopping if this issue persists."
      )
    end

    unless user.valid_auth_code?(phone, code, salt)
      return UserLoginResponse.new("That code’s not right, better luck next time 😬")
    end

    UserLoginResponse.new(nil, user)
  end

  UserLoginResponse = Struct.new(:error, :user)
end
