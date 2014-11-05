require 'rails_helper'

describe TwitterAPIWorker do
  Sidekiq::Testing.fake!

  before do
    @user = User.create(twitter_screen_name: 'Will_Faurot')
  end

  it 'adds a job to the queue' do
    expect {
      TwitterAPIWorker.perform_async(@user.twitter_screen_name, @user.id)
    }.to change(TwitterAPIWorker.jobs, :size).by(1)
  end

  it 'creates new twitter activity' do
    VCR.use_cassette('twitter/worker_tweets') do
      work = TwitterAPIWorker.new
      work.perform(@user.twitter_screen_name, @user.id)
      expect(TwitterActivity.first.url).to be
    end
  end
end
