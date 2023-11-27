module UserLogin
  module_function

  def start_auth(params)
    salt = User.generate_auth_salt
    user = User.find_by(phone: params[:phone])

    if !user.nil?
      User.send_login_code_message_to_user(user, user.auth_code(salt))
      salt
    else
      user = User.create!(email: params[:email],
        first_name: params[:first_name],
        phone: params[:phone],
        auth_secret: salt)
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

    unless user.valid_auth_code?(code, salt)
      return UserLoginResponse.new("That code’s not right, better luck next time 😬")
    end

    UserLoginResponse.new(nil, user)
  end

  UserLoginResponse = Struct.new(:error, :user)
end
