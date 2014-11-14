class Api::UsersController < ApplicationController
  # include ResponseJsonFaker

  def index
    users = User.all
    if current_user
      users = users.reject { |x| x.id == current_user.id }
    end

    render json: users
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
    # subscriptions now have their own table
    # @user.add_tracked_subscriptions(params[:subscriptions_hash])
    render json: @user #this should be to the user's feed page
  end
end
