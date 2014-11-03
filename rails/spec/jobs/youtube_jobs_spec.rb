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
      YoutubeAPIWorker.perform_async(@user.tracked_subscriptions)
    }.to change(YoutubeAPIWorker.jobs, :size).by(1)
  end

  it 'executes the queued jobs' do
    VCR.use_cassette('channelDetail_and_uploads') do
      expect {
        YoutubeAPIWorker.perform_async(@user.tracked_subscriptions)
      }.to change(YoutubeAPIWorker.jobs, :size).by(1)
      YoutubeAPIWorker.drain
      expect(YoutubeAPIWorker.jobs.size).to eq 0
    end
  end

  it 'returns the urls of videos' do
    # activity = Activity.create
    # VCR.use_cassette('channelDetail_and_uploads') do
    #   expect(activity.youtube).to eq(nil)
    #   YoutubeAPIWorker.perform_async(@user.tracked_subscriptions)
    #   activiy = Activity.find(activity.id)
    #   expect(activity.youtube).to eq(["https://www.youtube.com/watch?v=xYIBQoAfvf4", "https://www.youtube.com/watch?v=rYsvjbFCUJU", "https://www.youtube.com/watch?v=zEp8HzG8K5A", "https://www.youtube.com/watch?v=KFqbt0XAGfo","https://www.youtube.com/watch?v=YCpm75mXUFE"])
    # end
  end
end
