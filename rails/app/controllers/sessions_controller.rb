class SessionsController < ApplicationController
  respond_to :json

  def create
    auth = request.env['omniauth.auth']
    @identity = Identity.find_from_hash(auth)
    if @identity.nil?
      @identity = Identity.create_from_hash(auth, current_user)
    end

    if signed_in?
      if @identity.user == current_user
        render :close_window
      else
        @identity.user = current_user
        @identity.save
        render :close_window
      end
    else
      if @identity.user.present?
        self.current_user = @identity.user
        redirect_to "http://localhost:4200/users/#{@identity.user.id}"
      else
        redirect_to "http://localhost:4200"
      end
    end
  end
end
