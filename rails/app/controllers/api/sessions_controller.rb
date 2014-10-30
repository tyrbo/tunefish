class Api::SessionsController < ApplicationController
  respond_to :json
  
  def create
    auth = request.env['omniauth.auth']
    @identity = Identity.find_from_hash(auth)
    if @identity.nil?
      @identity = Identity.create_from_hash(auth, current_user)
      respond_with @identity.user
    end

    if signed_in?
      if @identity.user == current_user
        respond_with @identity.user
      else
        @identity.user = current_user
        @identity.save
        respond_with @identity.user
      end
    else
      if @identity.user.present?
        self.current_user = @identity.user
        respond_with @identity.user
      else
        #redirect to new user
      end
    end
  end

end
