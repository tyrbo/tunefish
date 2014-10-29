class YoutubeAPI
  Api_key = ENV['google_key']

  def self.get_new_subscriber_videos(user)
    connection.get 'users/default/newsubscriptionvideos' + "/?key=#{Api_key}",
                   {}, {'Authorization' => "#{user.google_token}"}
  end

  private

  def self.connection
    Faraday.new(:url => 'https://gdata.youtube.com/feeds/api/') do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end
end
