class SoundcloudAPI
  attr_reader :api_key, :soundcloud_user_id

  def initialize(api_key, soundcloud_user_id)
    @api_key = api_key
    @soundcloud_user_id = soundcloud_user_id
  end

  def get_favorited_tracks_for_user
    connection.get("/users/#{soundcloud_user_id}/favorites.json?client_id=#{api_key}")
  end

  private

  def connection
    Faraday.new(:url => 'https://api.soundcloud.com') do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end
  end
end
