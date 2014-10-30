class YoutubeAPI
  Api_key = ENV['google_key']

  def self.get_subscriptions(channel_id=nil)
    search_url = "/youtube/v3/subscriptions?part=snippet&key=#{Api_key}"

    if channel_id
      search_url += "&channelId=#{channel_id}"
    else
      search_url += '&mine=true'
    end

    connection.get search_url
  end

  def self.get_subscription_details(channel_ids)
    ids_string = channel_ids.join(",")
    connection.get "/youtube/v3/channels?part=contentDetails&fields=items/contentDetails&key=#{Api_key}&id=#{ids_string}"
  end

  def self.get_uploads(uploads_id)
    connection.get "/youtube/v3/playlistItems?part=snippet&maxResults=5&key=#{Api_key}&playlistId=#{uploads_id}"
  end

  private

  def self.connection
    Faraday.new(:url => 'https://www.googleapis.com') do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end
end
