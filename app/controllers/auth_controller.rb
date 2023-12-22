class AuthController < ApplicationController
  def show
  end

  def create
    session[:phone] = params[:phone]
    session[:salt] = UserLogin.start_auth(params)

    redirect_to auth_verifications_path
  rescue ActiveRecord::RecordInvalid
    render :show
  end

  def new_account
  end

  def destroy
    session.delete(:user_id)
    redirect_to auth_path, notice: "You are signed out"
  end
end
