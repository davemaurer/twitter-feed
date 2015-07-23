class TweetsController < ApplicationController
  def new
  end

  def create
    current_user.twitter_client.update(params[:tweet])
    redirect_to dashboard_index_path
  end
end
