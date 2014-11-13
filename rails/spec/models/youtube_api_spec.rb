require 'rails_helper'

describe YoutubeAPI, type: :model do

  describe '.get_subscriptions' do
    it 'gets all youtube subscriptions for a user' do
      VCR.use_cassette('youtube/subscriptions') do
        channel_id = "UC_R3-VJlFnDhlG_9hk-tZiQ"
        response = YoutubeAPI.get_subscriptions("user", channel_id)
        expect(response.status).to eq 200
        expect(response.body).to match("channelId")
      end
    end
  end

  describe '.get_subscription_details' do
    it 'gets contentDetail for a channel' do
      VCR.use_cassette('youtube/channelDetail') do
        channel_id = "UCn8zNIfYAQNdrFRrr8oibKw"
        response = YoutubeAPI.get_subscription_details(channel_id)
        expect(response.status). to eq 200
        expect(response.body).to match("uploads")
      end
    end
  end

  describe '.get_uploads' do
    it 'gets a list of uploads for a channel' do
      VCR.use_cassette('youtube/uploads') do
        uploads_id = ["UUn8zNIfYAQNdrFRrr8oibKw"]
        response = YoutubeAPI.get_uploads(uploads_id)
        expect(response.status).to eq 200
        expect(response.body).to match("videoId")
      end
    end
  end
end
