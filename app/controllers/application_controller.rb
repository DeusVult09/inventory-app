class ApplicationController < ActionController::Base
  stale_when_importmap_changes
  before_action :check_user_status
  helper_method :current_user

  private 
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def check_user_status
    return unless session[:user_id]
    if current_user.nil? || current_user.blocked?
      reset_session
      redirect_to root_path, alert: "Your session has ended. The user is no longer active!"
    end
  end

  def require_login
    redirect_to root_path, alert: "You need to sign in first" unless current_user
  end
end
