class YoutubeAPIWorker
  include Sidekiq::Worker

  def perform(channel_ids)
    uploads_ids = get_uploads_ids(channel_ids)
    videos_ids = get_recent_uploads(uploads_ids)
  end

  def get_uploads_ids(channel_ids)
    channel_details_json = YoutubeAPI.get_subscription_details(channel_ids)
    channel_details = JSON.parse channel_details_json.body
    uploads_ids = channel_details['items'].map do |channel|
      title = channel['contentDetails']['relatedPlaylists']['uploads']
    end
  end

  def get_recent_uploads(uploads_ids)
    playlists = uploads_ids.map do |upload_id|
      playlist_json = YoutubeAPI.get_uploads(upload_id).body
      playlist = JSON.parse playlist_json
      video_ids = playlist['items'].map do |item|
        item['snippet']['resourceId']['videoId']
      end
    end
    playlists.flatten
  end
end
