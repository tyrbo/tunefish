class SoundcloudAPIWorker
  include Sidekiq::Worker

  def perform(user)
    soundcloud = SoundcloudAPI.new(ENV['soundcloud_key'], user.soundcloud_user_id)
    resp = soundcloud.get_favorited_tracks_for_user
    tracks = JSON.parse(resp.body)
    tracks.each do |track|
      SoundcloudActivity.create(url: track['id'], user_id: user.id, provider: 'soundcloud')
    end
  end
end
