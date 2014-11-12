class Api::StatusesController < ApplicationController
  def show
    render json: { status: 'available' }
  end
end
