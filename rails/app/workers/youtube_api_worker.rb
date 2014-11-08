class YoutubeAPIWorker
  include Sidekiq::Worker

  def perform(channel_ids, current_user_id)
    uploads_ids = get_uploads_ids(channel_ids)
    video_urls = get_recent_uploads(uploads_ids)
    assign_urls_to_activity(video_urls, current_user_id)
  end

  def get_uploads_ids(channel_ids)
    channel_details_json = YoutubeAPI.get_subscription_details(channel_ids)
    channel_details = JSON.parse channel_details_json.body
    channel_details['items'].map do |channel|
      title = channel['contentDetails']['relatedPlaylists']['uploads']
    end
  end

  def get_recent_uploads(uploads_ids)
    playlists = uploads_ids.map do |upload_id|
      playlist_json = YoutubeAPI.get_uploads(upload_id).body
      playlist = JSON.parse playlist_json
      video_urls = playlist['items'].map do |item|
        video_id = item['snippet']['resourceId']['videoId']
        "//www.youtube.com/embed/#{video_id}"
      end
    end

    playlists.flatten
  end

  def assign_urls_to_activity(urls, current_user_id)
    urls.each do |url|
      YoutubeActivity.create(url: url, user_id: current_user_id, provider: 'youtube')
    end
  end
end
