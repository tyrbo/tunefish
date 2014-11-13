class Api::ActivitiesController < ApplicationController
  def index
    if current_user
      @activities = current_user.activities.order('id DESC')
      render json: @activities, each_serializer: ActivitySerializer
    else
      render json: { "status" =>  404, "message" => "not found" }.to_json, status: :unprocessable_entity
    end
  end
end
