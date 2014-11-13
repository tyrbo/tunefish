class Api::ActivitiesController < ApplicationController
  def index
    if current_user
      scoped_activities = current_user.activities.order('id DESC').select do |activity|
        if activity.youtube_subscription
          if activity.youtube_subscription.tracked == true
            activity
          end
        else
          activity
        end
      end
      @activities = scoped_activities
      render json: @activities, each_serializer: ActivitySerializer
    else
      render json: { "status" =>  404, "message" => "not found" }.to_json, status: :unprocessable_entity
    end
  end
end
