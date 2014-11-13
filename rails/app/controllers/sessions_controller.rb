class SessionsController < ApplicationController

  def create
    auth = request.env['omniauth.auth']
    @identity = Identity.find_from_hash(auth)
    @identity = Identity.create_from_hash(auth, current_user) unless @identity

    # Fire 3rd party api requests only for services associated with a user
    if @identity.user.soundcloud_user_id
      SoundcloudAPIWorker.perform_async(@identity.user.soundcloud_user_id, @identity.user.id)
    end

    if @identity.user.twitter_screen_name
      TwitterAPIWorker.perform_async(@identity.user.twitter_screen_name, @identity.user.id)
    end

    if auth['provider'] == 'google_oauth2'
      subscriptions_json = YoutubeAPI.get_subscriptions(@identity.user).body
      subscriptions = @identity.user.parse_subscriptions(subscriptions_json)

      subscriptions.each do |title, channel_id|
        @identity.user.youtube_subscriptions.find_or_create_by(title: title, channel_id: channel_id)
      end
    end

    if signed_in?
      if @identity.user != current_user
        @identity.user = current_user
        @identity.save
      end
    else
      if @identity.user.present?
        self.current_user = @identity.user
      end
    end

    if auth['provider'] == 'soundcloud'
      redirect_to activities_path
    else
      render :close_window
    end
  end
end
