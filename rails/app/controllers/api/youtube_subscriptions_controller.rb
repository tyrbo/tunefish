class Api::YoutubeSubscriptionsController < ApplicationController
  def index
    render json: current_user.youtube_subscriptions.all
  end
end
