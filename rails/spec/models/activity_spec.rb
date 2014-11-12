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

  context 'type percentages' do
    before(:each) do
      5.times {youtube_activity = YoutubeActivity.create}
      4.times {soundcloud_activity = SoundcloudActivity.create}
      twitter_activity = TwitterActivity.create
    end

    it 'should calculate the percentage of youtube activities the activity has' do
      expect(Activity.youtube_percentage).to eq(50)
    end

    it 'should calculate the percentage of soundcloud activities the activity has' do
      expect(Activity.soundcloud_percentage).to eq(40)

    end

    it 'should calculate the percentage of youtube activities the activity has' do
      expect(Activity.twitter_percentage).to eq(10)
    end
  end
end
