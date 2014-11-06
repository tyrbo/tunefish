require 'rails_helper'

RSpec.describe YoutubeSubscription, :type => :model do
  before do
    @ys = YoutubeSubscription.new(title: "Example title",
                                  channel_id: "12345",
                                  user_id: 1)
  end

  it 'has the correct attributes' do
    expect(@ys).to respond_to :title
    expect(@ys).to respond_to :channel_id
    expect(@ys).to respond_to :tracked
  end

  it 'should default tracked to false' do
    expect(@ys.tracked). to eq false
  end
end
