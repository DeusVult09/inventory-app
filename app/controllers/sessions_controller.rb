class SessionsController < ApplicationController
  before_action :omniauth_hash

  def create
    current_user = create_or_find_auth_user
    return user_sign_in if current_user.active? 
    redirect_to root_path, notice: "Your account is blocked" if current_user.blocked?
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "User logged out", status: :see_other
  end

  def failure
    redirect_to root_path, alert: "Unable to authenticate. Please try again."
  end

  private 

  def omniauth_hash
    request.env["omniauth.auth"]
  end

  def create_or_find_auth_user
    User.create_or_find_by(provider: omniauth_hash["provider"], uid: omniauth_hash["uid"]) do |user|
    user.email = omniauth_hash.dig("info", "email")
    user.name = omniauth_hash.dig("info", "name").presence || "User"
    end
  end

  def user_sign_in(message= "Signed in Successfully")
    reset_session
    session[:user_id] = user.id 
    redirect_to root_path, flash.now[:notice] = message
  end
end
