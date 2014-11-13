class Api::V1::Users::ActivitiesController < ApplicationController
  def index
    user = User.find(params[:user_id])
    render json: user.activities
  end
end
