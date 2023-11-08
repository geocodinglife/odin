class AuthController < ApplicationController
  # skip_before_action :authenticate_user!, except: :destroy

  def show
  end

  def create
    session[:phone] = params[:phone]
    session[:salt] = UserLogin.start_auth(params)
    redirect_to auth_verifications_path
  rescue ActiveRecord::RecordInvalid
    # If the user creations fails (usually when first and last name are empty)
    # we reload the form, and also display the first and last name fields.
    render :show
  end

  def destroy
    session.delete(:user_id)
    redirect_to auth_path, notice: "You are signed out"
  end
end
