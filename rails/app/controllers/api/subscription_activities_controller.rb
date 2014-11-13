class Api::SubscriptionActivitiesController < ApplicationController

  def index
    user_activities = current_user.following.flat_map do |user|
      user.activities
    end
    render json: user_activities
  end

end
