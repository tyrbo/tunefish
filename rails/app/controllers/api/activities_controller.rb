class Api::ActivitiesController < ApplicationController
  def index
    render json: Activity.all.shuffle
  end
end
