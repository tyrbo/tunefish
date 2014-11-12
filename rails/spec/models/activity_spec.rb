RSpec.describe Activity, :type => :model do
  it { should belong_to(:user) }

  it 'should have a youtube scope' do
    youtube_activity = YoutubeActivity.create
    expect(Activity.youtube.first).to eq(youtube_activity)
  end

  it 'should have a soundcloud scope' do
    soundcloud_activity = SoundcloudActivity.create
    expect(Activity.soundcloud.first).to eq(soundcloud_activity)
  end

  it 'should have a twitter scope' do
    twitter_activity = TwitterActivity.create
    expect(Activity.twitter.first).to eq(twitter_activity)
  end
end
