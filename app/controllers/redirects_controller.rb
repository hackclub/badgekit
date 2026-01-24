class RedirectsController < ApplicationController
  def show
    user = User.find_by(slack_id: params[:slack_id])

    if user&.redirect_url.present?
      redirect_to user.redirect_url, allow_other_host: true
    else
      @slack_id = params[:slack_id]
      render :not_found, status: :not_found
    end
  end
end
