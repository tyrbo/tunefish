class Api::ActivitiesController < ApplicationController
  def index
    @activities = current_user.activities.shuffle
    render json: @activities, each_serializer: ActivitySerializer
  end
end
