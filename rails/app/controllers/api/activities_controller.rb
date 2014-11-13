class Api::ActivitiesController < ApplicationController
  def index
    scoped_activities = current_user.activities.select do |activity|
      if activity.youtube_subscription
        if activity.youtube_subscription.tracked == true
          activity
        end
      else
        activity
      end
    end
    @activities = scoped_activities.shuffle
    render json: @activities, each_serializer: ActivitySerializer
  end
end
