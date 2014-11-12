class Api::SubscriptionActivitiesController < ApplicationController

  def index
    if current_user
      activities = current_user.following.flat_map do |user|
        user.activities
      end
      render json: activities
    else
      render json: { "status" =>  404, "message" => "not found" }.to_json, status: :unprocessable_entity
    end
  end

end
