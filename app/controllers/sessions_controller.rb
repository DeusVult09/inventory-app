class SessionsController < ApplicationController

  def create
    user = create_or_find_auth_user
    if user.active? && user.persisted?
      user_sign_in
    elsif user.blocked?
      redirect_to root_path, alert: "Your account is blocked"
    else
      redirect_to root_path, alert: "Account cannot be created without an email"
    end
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
    user.name = omniauth_hash.dig("info", "name").presence || "Nickname" || "User"
    end
  end

  def user_sign_in(user)
    reset_session
    session[:user_id] = user.id 
    redirect_to root_path, notice: "Signed in Successfully"
  end
end
