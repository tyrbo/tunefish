class SessionsController < ApplicationController

  def create
    auth = request.env['omniauth.auth']
    @identity = Identity.find_from_hash(auth)
    if @identity.nil?
      @identity = Identity.create_from_hash(auth, current_user)
      if auth['provider'] == 'soundcloud'
        @identity.user.update_attributes(soundcloud_user_id: auth['extra']['raw_info']['id'])
      end
    end

    # Save soundcloud activity
    SoundcloudAPIWorker.perform_async(@identity.user.soundcloud_user_id, @identity.user.id)

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
