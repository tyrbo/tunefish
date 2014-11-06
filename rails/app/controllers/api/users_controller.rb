class Api::UsersController < ApplicationController
  # include ResponseJsonFaker

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if Rails.env.test?
      params[:subscriptions_hash] = @user.subscriptions(YoutubeAPI.get_subscriptions("UC_R3-VJlFnDhlG_9hk-tZiQ"))
    else
      params[:subscriptions_hash] = @user.subscriptions(YoutubeAPI.get_subscriptions)
    end
    @user.add_tracked_subscriptions(params[:subscriptions_hash])
    render json: User.last #this should be to the user's feed page
  end
end
