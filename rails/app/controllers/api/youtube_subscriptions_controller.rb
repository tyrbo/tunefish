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
    sub = YoutubeSubscription.includes(:activities).find(params[:id])
    sub.update_attribute(:tracked, params['youtube_subscription']['tracked'])
    if params['youtube_subscription']['tracked'] == 'true'
      channel_id = params['youtube_subscription']['channel_id']
      
      sub.activities.each do |x|
        Pusher.trigger("user_#{current_user.id}", 'activity', ActivitySerializer.new(x).to_json)
      end

      YoutubeAPIWorker.perform_async(channel_id, current_user.id, params[:id])
    end
    render json: sub
  end
end
