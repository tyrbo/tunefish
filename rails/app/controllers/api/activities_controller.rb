class Api::ActivitiesController < ApplicationController
  def index
    respond_to do |format|
        format.json { render json: Activity.all.shuffle }
    end
  end
end
