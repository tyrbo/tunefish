require 'rails_helper'

describe YoutubeAPI, type: :model do

  describe '.get_subscriptions' do
    it 'gets all youtube subscriptions for a user' do
      VCR.use_cassette('subscriptions') do
        channel_id = "UC_R3-VJlFnDhlG_9hk-tZiQ"
        response = YoutubeAPI.get_subscriptions(channel_id)
        expect(response.status).to eq 200
      end
    end
  end

  describe '.get_subscription_details' do
    it 'gets contentDetail for a channel' do
      VCR.use_cassette('channelDetail') do
        channel_ids = ["UCn8zNIfYAQNdrFRrr8oibKw",
                       "UCt7YulMv6FtTkUGBWqOK9KQ",
                       "UC_R3-VJlFnDhlG_9hk-tZiQ"]
        response = YoutubeAPI.get_subscription_details(channel_ids)
        expect(response.status). to eq 200
      end
    end
  end

  describe '.get_uploads' do
    it 'gets a list of uploads for a channel' do
      VCR.use_cassette('uploads') do
        uploads_id = "UUn8zNIfYAQNdrFRrr8oibKw"
        response = YoutubeAPI.get_uploads(uploads_id)
        expect(response.status).to eq 200
      end
    end
  end

  #call the api to find user's subscriptions
  #call api for each subscription part:contentDetails, id: the channel id
  #find the uploads value in the response
  #make api call to get playlistItems part: snippet, id: uploads value
  #send all those to some kind of feed
  #https://www.googleapis.com/youtube/v3/subscriptions?part=snippet&key=AIzaSyBL9xCOlf9VoLtOyHq78KfF7R17zsYx75k&channelId=UC_R3-VJlFnDhlG_9hk-tZiQ
  #https://www.googleapis.com/subscriptions?channelId=UC_R3-VJlFnDhlG_9hk-tZiQ&key=AIzaSyBL9xCOlf9VoLtOyHq78KfF7R17zsYx75k&part=snippet
end
