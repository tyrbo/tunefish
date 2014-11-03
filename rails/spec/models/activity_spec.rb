RSpec.describe Activity, :type => :model do
  it { should belong_to(:user) }

  it 'should have a youtube scope' do
    youtube_activity = YoutubeActivity.create
    expect(Activity.youtube.first).to eq(youtube_activity)
  end
end
