class TweetsController < ApplicationController
  def new
    @tweet = params[:tweet].to_s
  end

  def create

  end
end
