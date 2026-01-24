class SessionsController < ApplicationController
  def new
    redirect_to dashboard_path if current_user
  end

  def create
    auth = request.env["omniauth.auth"]
    
    user = User.find_or_create_by!(slack_id: auth.info.slack_id)

    session[:user_id] = user.id

    redirect_to session.delete(:return_to) || dashboard_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out"
  end

  def failure
    redirect_to login_path, alert: "Authentication failed: #{params[:message]}"
  end
end
