class DashboardController < ApplicationController
  before_action :require_login

  def show
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to dashboard_path, notice: "Redirect URL updated!"
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:redirect_url)
  end

  def require_login
    unless current_user
      session[:return_to] = request.fullpath
      redirect_to login_path
    end
  end
end
