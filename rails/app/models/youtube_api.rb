class YoutubeAPI
  Api_key = ENV['google_key']

  def self.get_subscriptions(current_user, channel_id=nil)
    search_url = "/youtube/v3/subscriptions?part=snippet&maxResults=50&fields=items/snippet&key=#{Api_key}"
    if channel_id
      search_url += "&channelId=#{channel_id}"
      connection.get do |req|
        req.url search_url
      end
    else
      search_url += '&mine=true'
      connection.get do |req|
        req.url search_url
        req.headers['Authorization'] = current_user.google_token
        req.headers['X-GData-Key'] = "key=#{Api_key}"
      end
    end
  end

  def self.get_subscription_details(channel_id)
    connection.get "/youtube/v3/channels?part=contentDetails&fields=items/contentDetails/relatedPlaylists/uploads&key=#{Api_key}&id=#{channel_id}"
  end

  def self.get_uploads(uploads_id)
    uploads_id = uploads_id[0]
    connection.get "/youtube/v3/playlistItems?part=snippet&fields=items/snippet/resourceId/videoId&maxResults=5&key=#{Api_key}&playlistId=#{uploads_id}"
  end

  #link to video = https://www.youtube.com/watch?v=#{video_id}

  private

  def self.connection
    Faraday.new(:url => 'https://www.googleapis.com') do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end
end
