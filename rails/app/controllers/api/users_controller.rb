class Api::UsersController < ApplicationController

  def index
    render json: User.all
  end

  def show
    render json: User.includes(:identities).find(params[:id])
  end
end
