require 'rails_helper'

describe YoutubeAPIWorker do
  Sidekiq::Testing.fake!

  before(:each) do
    @user = User.create
    @channel_id = "UCn8zNIfYAQNdrFRrr8oibKw"
    @youtube_subscription = YoutubeSubscription.create(user_id: @user.id, channel_id: "UCn8zNIfYAQNdrFRrr8oibKw", title: 'YAY', tracked: 'true')
  end

  it 'adds a job to the queue' do
    expect {
      YoutubeAPIWorker.perform_async(@channel_ids, @user.id, @youtube_subscription.id )
    }.to change(YoutubeAPIWorker.jobs, :size).by(1)
  end

  it 'executes the queued jobs' do
    VCR.use_cassette('youtube/channelDetail_and_uploads') do
      expect {
        YoutubeAPIWorker.perform_async(@channel_id, @user.id, @youtube_subscription.id)
      }.to change(YoutubeAPIWorker.jobs, :size).by(1)
      YoutubeAPIWorker.drain
      expect(YoutubeAPIWorker.jobs.size).to eq 0
    end
  end

  it 'saves youtube activity to the database' do
    VCR.use_cassette('youtube/testing_youtube') do
      expect(YoutubeActivity.count).to eq 0
      YoutubeAPIWorker.new.perform(@channel_id, @user.id, @youtube_subscription.id)
      expect(YoutubeActivity.count).to be > 0
    end
  end
end
