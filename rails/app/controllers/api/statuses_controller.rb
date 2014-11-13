class Api::StatusesController < ApplicationController
  def show
    user_id = nil
    if current_user
      user_id = current_user.id
    end

    render json: { status: 'available', user_id: user_id }
  end
end
