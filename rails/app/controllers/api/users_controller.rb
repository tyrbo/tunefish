class Api::UsersController < ApplicationController

  def index
    render json: User.all
  end

  def show
    render json: current_user.includes(:identities)
  end

  def update
    @user = User.find(params[:id])
    @user.add_tracked_subscriptions(params[:subscriptions_hash])
    #trigger background worker
    render json: current_user.includes(:identities)
  end
end
