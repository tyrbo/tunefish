class Api::ActivitiesController < ApplicationController
  def index
    if current_user
      scoped_activities = current_user.activities.order('id DESC').select do |activity|
        if activity.youtube_subscription
          if activity.youtube_subscription.tracked
            activity
          end
        else
          activity
        end
      end

      render json: scoped_activities
    else
      render json: { "status" =>  404, "message" => "not found" }.to_json, status: :unprocessable_entity
    end
  end
end
