class Api::ActivitiesController < ApplicationController
  def index
    render json: YoutubeActivity.all
  end
end
