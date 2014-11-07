require 'rails_helper'

describe YoutubeAPIWorker do
  Sidekiq::Testing.fake!

  before(:each) do
    @user = User.create
    @channel_ids = ["UCn8zNIfYAQNdrFRrr8oibKw",
                   "UCt7YulMv6FtTkUGBWqOK9KQ",
                   "UC_R3-VJlFnDhlG_9hk-tZiQ"]
  end

  it 'adds a job to the queue' do
    expect {
      YoutubeAPIWorker.perform_async(@channel_ids, @user.id)
    }.to change(YoutubeAPIWorker.jobs, :size).by(1)
  end

  xit 'executes the queued jobs' do
    VCR.use_cassette('channelDetail_and_uploads') do
      expect {
        YoutubeAPIWorker.perform_async(@channel_ids, @user.id)
      }.to change(YoutubeAPIWorker.jobs, :size).by(1)
      YoutubeAPIWorker.drain
      expect(YoutubeAPIWorker.jobs.size).to eq 0
    end
  end

  it 'saves youtube activity to the database' do
    VCR.use_cassette('testing_youtube') do
      expect(YoutubeActivity.count).to eq 0
      YoutubeAPIWorker.new.perform(@channel_ids, @user.id)
      expect(YoutubeActivity.count).to be > 0
    end
  end
end
