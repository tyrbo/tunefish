class SoundcloudAPIWorker
  include Sidekiq::Worker

  def perform(soundcloud_user_id, user_id)
    soundcloud = SoundcloudAPI.new(ENV['soundcloud_key'], soundcloud_user_id)
    resp = soundcloud.get_favorited_tracks_for_user
    tracks = JSON.parse(resp.body)
    tracks.each do |track|
      SoundcloudActivity.create(url: track['id'], user_id: user_id, provider: 'soundcloud')
    end
  end
end
