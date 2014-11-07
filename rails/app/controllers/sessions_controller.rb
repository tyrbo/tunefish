class SessionsController < ApplicationController

  def create
    auth = request.env['omniauth.auth']
    @identity = Identity.find_from_hash(auth)
    @identity = Identity.create_from_hash(auth, current_user) unless @identity

    # Fire 3rd party api requests only for services associated with a user
    if @identity.user.soundcloud_user_id
      SoundcloudAPIWorker.perform_async(@identity.user.soundcloud_user_id, @identity.user.id)
    elsif @identity.user.twitter_screen_name
      TwitterAPIWorker.perform_async(@identity.user.twitter_screen_name, @identity.user.id)
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
        render :close_window
      else
        render :close_window
      end
    end
  end
end
