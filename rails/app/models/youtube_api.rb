class YoutubeAPI
  Api_key = ENV['google_key']

  def self.get_subscriptions(channel_id=nil)
    search_url = "/youtube/v3/subscriptions?part=snippet&fields=items/snippet/channelId&key=#{Api_key}"

    if channel_id
      search_url += "&channelId=#{channel_id}"
    else
      search_url += '&mine=true'
    end

    connection.get search_url
  end

  def self.get_subscription_details(channel_ids)
    ids_string = channel_ids.join(",")
    connection.get "/youtube/v3/channels?part=contentDetails&fields=items/contentDetails/relatedPlaylists/uploads&key=#{Api_key}&id=#{ids_string}"
  end

  def self.get_uploads(uploads_id)
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
