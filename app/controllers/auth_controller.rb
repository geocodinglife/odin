class AuthController < ApplicationController
  # skip_before_action :authenticate_user!, except: :destroy

  def show
  end

  def create
    session[:phone] = params[:auth][:phone]
    session[:salt] = UserLogin.start_auth(params[:auth])

    redirect_to auth_verifications_path
  rescue ActiveRecord::RecordInvalid
    render :show
  end

  def destroy
    session.delete(:user_id)
    redirect_to auth_path, notice: "You are signed out"
  end
end
