class YoutubeAPIWorker
  include Sidekiq::Worker

  def perform(channel_id, current_user_id, youtube_subscription_id)
    uploads_id = get_uploads_id(channel_id)
    video_urls = get_recent_uploads(uploads_id)
    assign_urls_to_activity(video_urls, current_user_id, youtube_subscription_id)
  end

  def get_uploads_id(channel_id)
    channel_details_json = YoutubeAPI.get_subscription_details(channel_id)
    channel_details = JSON.parse channel_details_json.body
    channel_details['items'].map do |channel|
      title = channel['contentDetails']['relatedPlaylists']['uploads']
    end
  end

  def get_recent_uploads(uploads_id)
    playlist_json = YoutubeAPI.get_uploads(uploads_id).body
    playlist = JSON.parse playlist_json
    video_urls = playlist['items'].map do |item|
      video_id = item['snippet']['resourceId']['videoId']
      "//www.youtube.com/embed/#{video_id}"
    end
  end

  def assign_urls_to_activity(urls, current_user_id, youtube_subscription_id)
    new_videos = urls.map do |url|
      YoutubeActivity.find_or_create_by(url: url, user_id: current_user_id, provider: 'youtube', youtube_subscription_id: youtube_subscription_id) do |x|
        x
      end
    end
  
    new_videos.each { |x| Pusher.trigger("user_#{current_user_id}", 'activity', x.to_json) }
  end
end
