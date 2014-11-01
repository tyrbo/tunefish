require 'rails_helper'

describe SoundcloudAPI, type: :model do
  it 'gets all soundcloud tracks for a user' do
    VCR.use_cassette('soundcloud/user_tracks') do
      api_key = ENV["soundcloud_key"]
      soundcloud_user_id = '3171632' # https://soundcloud.com/itsnocturne
      soundcloud = SoundcloudAPI.new(api_key, soundcloud_user_id)
      response = soundcloud.get_favorited_tracks_for_user
      expect(response.status).to eq(200)
      expect(response.body).to match('"kind":"track"')
    end
  end
end
