class SessionsController < ApplicationController

  def create
    auth = request.env['omniauth.auth']
    @identity = Identity.find_from_hash(auth)
    if @identity.nil?
      @identity = Identity.create_from_hash(auth, current_user)
      # This can be moved to Identity.create_from_hash
      if auth['provider'] == 'soundcloud'
        @identity.user.update_attributes(soundcloud_user_id: auth['extra']['raw_info']['id'])
      elsif auth['provider'] == 'twitter'
        @identity.user.update_attributes(twitter_screen_name: auth['info']['nickname'])
      end
    end
    # Fire 3rd party api requests only for services associated with a user
    if @identity.user.soundcloud_user_id
      SoundcloudAPIWorker.perform_async(@identity.user.soundcloud_user_id, @identity.user.id)
    elsif @identity.user.twitter_screen_name
      TwitterAPIWorker.perform_async(@identity.user.twitter_screen_name, @identity.user.id)
    end

    # if auth['provider'] == 'google_oauth2'
    #   subscriptions_json = YoutubeAPI.get_subscriptions(current_user).body
    #   subscriptions = @identity.user.parse_subscriptions(subscriptions_json)

    #   binding.pry
    #   subscriptions.each do |sub|
    #     user.youtube_subscriptions.create(title: sub["title"], channel_id: sub["channel_id"])
    #   end

    #   channel_ids = subscriptions_hash.values
    #   YoutubeAPIWorker.perform_async(channel_ids)
    # end

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
