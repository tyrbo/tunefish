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
    if params['youtube_subscription']['tracked'] == 'true'
      channel_id = params['youtube_subscription']['channel_id']
      YoutubeAPIWorker.perform_async(channel_id, current_user.id, params[:id])
    end
    render json: sub
  end
end
