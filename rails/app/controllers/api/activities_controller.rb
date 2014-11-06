class Api::ActivitiesController < ApplicationController
  def index
    render json: current_user.activities.shuffle
  end
end
