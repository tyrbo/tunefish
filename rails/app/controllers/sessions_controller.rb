class SessionsController < ApplicationController

  def create
    auth = request.env['omniauth.auth']
    @identity = Identity.find_from_hash(auth)
    if @identity.nil?
      @identity = Identity.create_from_hash(auth, current_user)
    end

    if signed_in?
      if @identity.user == current_user
        #redirect to root url
      else
        @identity.user = current_user
        @identity.save
        #redirect to root
      end
    else
      if @identity.user.present?
        self.current_user = @identity.user
        #redirect to root
      else
        #redirect to new user
      end
    end
  end
end
