class Api::ActivitiesController < ApplicationController
  def index
<<<<<<< HEAD
    render json: current_user.activities.shuffle
=======
    render json: Activity.all.shuffle
>>>>>>> 49e6cb6a21f8b46ea1b8006055c8dba1a0d3f855
  end
end
