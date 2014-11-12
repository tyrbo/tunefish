class Api::YoutubeSubscriptionsController < ApplicationController
  def index
    render json: current_user.youtube_subscriptions.all
  end

  def show
    render json: YoutubeSubscription.find(params[:id])
  end

  def update
    sub = YoutubeSubscription.find(params[:id])
    sub.update_attribute(:tracked, params['youtube_subscription']['tracked'])
    render json: sub
  end
end
