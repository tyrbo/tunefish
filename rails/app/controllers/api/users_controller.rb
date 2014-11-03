class Api::UsersController < ApplicationController

  def index
    render json: User.all
  end

  def show
    render json: current_user.includes(:identities)
  end

  def update
    @user = User.find(params[:id])
    params[:subscriptions_hash] = {"Cook's Illustrated - Topic" => "UCt7YulMv6FtTkUGBWqOK9KQ", "VICE" => "UCn8zNIfYAQNdrFRrr8oibKw", "Hilary Denton" => "UC_R3-VJlFnDhlG_9hk-tZiQ"}
    @user.add_tracked_subscriptions(params[:subscriptions_hash])
    YoutubeAPIWorker.perform_async(@user.tracked_subscriptions, @user.id)
    render json: User.last #this should be to the user's feed page
  end
end
