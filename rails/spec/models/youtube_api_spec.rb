require 'rails_helper'

describe YoutubeAPI, type: :model do
  # it 'test_example_dot_com' do
  #   VCR.use_cassette('synopsis') do
  #     response = Net::HTTP.get_response(URI('http://www.iana.org/domains/reserved'))
  #     assert_match /Example domains/, response.body
  #   end
  # end

  # What we're gonna test here
  # We're testing our interface
  # We want the new subscriber feed from youtube
  # using default
  # https://gdata.youtube.com/feeds/api/users/default/newsubscriptionvideos
  before(:each) do
    hash = { 'provider' => 'google_oauth2', 'uid' => '12345', 'info' => {'first_name' => 'Jon'}, 'credentials' => {'token' => '1/fFAGRNJru1FTz70BzhT3Zg'}}
    identity = Identity.create_from_hash(hash)
    @user = User.last
  end

  it 'retrieves new subscriber videos' do
    VCR.use_cassette('new_subscriber_videos') do
      response = YoutubeAPI.get_new_subscriber_videos(@user)
      expect(response.status).to eq 200
    end
  end
end
