class Api::SubscriptionActivitiesController < ApplicationController
  
  def index
    activities = current_user.following.flat_map do |user|
      user.activities
    end
    render json: activities
  end

end
