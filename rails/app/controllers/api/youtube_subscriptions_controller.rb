class Api::YoutubeSubscriptionsController < ApplicationController
  def index
    if current_user
      render json: current_user.youtube_subscriptions.all
    else
      render json: { "status" =>  404, "message" => "not found" }.to_json, status: :unprocessable_entity
    end
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
