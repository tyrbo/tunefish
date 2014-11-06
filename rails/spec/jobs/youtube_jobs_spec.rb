require 'rails_helper'

describe YoutubeAPIWorker do
  Sidekiq::Testing.fake!

  before(:each) do
    @user = User.create(tracked_subscriptions:
                  ["UCn8zNIfYAQNdrFRrr8oibKw",
                   "UCt7YulMv6FtTkUGBWqOK9KQ",
                   "UC_R3-VJlFnDhlG_9hk-tZiQ"])
  end

  it 'adds a job to the queue' do
    expect {
      YoutubeAPIWorker.perform_async(@user.tracked_subscriptions, @user.id)
    }.to change(YoutubeAPIWorker.jobs, :size).by(1)
  end

  it 'executes the queued jobs' do
    VCR.use_cassette('youtube/channelDetail_and_uploads') do
      expect {
        YoutubeAPIWorker.perform_async(@user.tracked_subscriptions, @user.id)
      }.to change(YoutubeAPIWorker.jobs, :size).by(1)
      YoutubeAPIWorker.drain
      expect(YoutubeAPIWorker.jobs.size).to eq 0
    end
  end

  it 'returns the urls of videos' do
    activity = Activity.create
    VCR.use_cassette('youtube/channelDetail_and_uploads') do
      expect(Activity.youtube.count).to eq(0)
      YoutubeAPIWorker.perform_async(@user.tracked_subscriptions, @user.id)
      YoutubeAPIWorker.drain
      expect(Activity.youtube.first.url).to eq("//www.youtube.com/embed/iMYBy_9WBl4")
    end
  end
end
