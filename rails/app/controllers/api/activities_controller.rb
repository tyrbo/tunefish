class Api::ActivitiesController < ApplicationController
  def index
    render json: current_user.activitites.all
  end
end
