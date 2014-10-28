class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    unless @identity = Identity.find_from_hash(auth)
      @identity = Identity.create_from_hash(auth, current_user)
    end
    self.current_user = @identity.user
    render :text => "Welcome, #{current_user.name}."
  end
end
