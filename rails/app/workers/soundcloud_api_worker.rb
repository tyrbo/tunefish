class SoundcloudAPIWorker
  include Sidekiq::Worker

  def perform(soundcloud_user_id, user_id)
    soundcloud = SoundcloudAPI.new(ENV['soundcloud_key'], soundcloud_user_id)
    resp = soundcloud.get_favorited_tracks_for_user
    tracks = JSON.parse(resp.body)
    new_tracks = tracks.map do |track|
      url = soundcloud_embed_url(track['id'])

      SoundcloudActivity.find_or_create_by(url: url, user_id: user_id, provider: 'soundcloud') do |x|
        x
      end
    end

    new_tracks.each { |x| Pusher.trigger("user_#{user_id}", 'activity', x.to_json) }
  end

  def soundcloud_embed_url(track_id)
    "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/#{track_id}&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"
  end
end
