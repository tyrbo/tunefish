class Api::UsersController < ApplicationController

  def index
    render json: User.all
  end

  def show
    render json: current_user.includes(:identities)
  end
end
