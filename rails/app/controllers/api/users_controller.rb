class Api::UsersController < ApplicationController

  def index
    render json: User.all
  end

  def show
    render json: current_user.includes(:identities)
  end

  def update
    @user = User.find(params[:id])
    params[:subscriptions_hash] = {"America's Test Kitchen" => "UCxAS_aK7sS2x_bqnlJHDSHw", "VICE" => "UCn8zNIfYAQNdrFRrr8oibKw"}
    @user.add_tracked_subscriptions(params[:subscriptions_hash])
    YoutubeAPIWorker.perform_async(@user.tracked_subscriptions)
    render json: User.last #this should be to the user's feed page
  end
end
