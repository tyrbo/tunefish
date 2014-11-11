class Api::SubscriptionsController < ApplicationController
  
  def index
    render json: current_user.following
  end

  def create
    if current_user.subscriptions.create(followed_id: params[:subscription][:followed_id]) 
      render json: current_user.following
    end
  end

  def destroy 
    follower = current_user.following.find(params[:subscription][:followed_id])

    if follower.destroy
      render json: current_user.following
    end
  end
end
