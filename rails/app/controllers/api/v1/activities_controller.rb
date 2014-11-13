class Api::V1::ActivitiesController < ApplicationController
  def index
    render json: Activity.all
  end
end
