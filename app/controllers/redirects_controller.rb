class RedirectsController < ApplicationController
  def show
    user = User.find_by(slack_id: params[:slack_id])

    url = user&.redirect_url
    if url.present? && url.match?(/\Ahttps:\/\/[^\n]+\z/i)
      redirect_to url, allow_other_host: true
    else
      @slack_id = params[:slack_id]
      render :not_found, status: :not_found
    end
  end
end
