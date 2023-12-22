class AuthVerificationsController < ApplicationController
  def show
    @phone = session[:phone]
    render "auth/verify"
  end

  def create
    @phone = session[:phone]
    resp = UserLogin.verify_information(@phone, params[:auth_code], session[:salt])

    if resp.error
      flash[:error] = resp.error
      render "auth/verify"
    else
      session.delete(:phone)
      session.delete(:salt)
      session[:user_id] = resp.user.id
      redirect_to root_path, notice: "You are now signed in"
    end
  end
end
