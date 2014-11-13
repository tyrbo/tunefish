require 'rails_helper'

RSpec.describe YoutubeSubscription, :type => :model do
  it { should have_many(:activities) }

  before do
    @youtube_subscription = YoutubeSubscription.new(title: "Example title",
                                                    channel_id: "12345",
                                                    user_id: 1)
  end

  it 'has the correct attributes' do
    expect(@youtube_subscription).to respond_to :title
    expect(@youtube_subscription).to respond_to :channel_id
    expect(@youtube_subscription).to respond_to :tracked
  end

  it 'should default tracked to false' do
    expect(@youtube_subscription.tracked). to eq false
  end
end
