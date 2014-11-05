class SessionsController < ApplicationController

  def create
    auth = request.env['omniauth.auth']
    @identity = Identity.find_from_hash(auth)
    if @identity.nil?
      @identity = Identity.create_from_hash(auth, current_user)
      if auth['provider'] == 'soundcloud'
        @identity.user.update_attributes(soundcloud_user_id: auth['extra']['raw_info']['id'])
      elsif auth['provider'] == 'twitter'
        binding.pry
        @identity.user.update_attributes(twitter_screen_name: auth['info']['nickname'])
      end
    end

    # Save soundcloud activity
    if @identity.user.soundcloud_user_id
      SoundcloudAPIWorker.perform_async(@identity.user.soundcloud_user_id, @identity.user.id)
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
    if auth['provider'] == 'google_oauth2'
      params[:subscriptions_hash] = @identity.user.subscriptions(YoutubeAPI.get_subscriptions(current_user))
      @identity.user.add_tracked_subscriptions(params[:subscriptions_hash])
    end
  end

  private

  # def save_details_for_provider(auth_hash)
  # end
end
