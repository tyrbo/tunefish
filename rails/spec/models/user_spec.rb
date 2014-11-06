require 'rails_helper'

RSpec.describe User, :type => :model do
  include ResponseJsonFaker

  it 'should create user from omniauth hash' do
    hash = {'info' => {'name' => 'Jon'}}
    user = User.create_from_hash!(hash)
    expect(user.name).to eq('Jon')
  end

  it { should have_many(:identities) }
  it { should have_many(:activities) }

  describe '#parse_subscriptions' do
    it 'returns a hash with titles and channel ids' do
      user = User.create
      json_string = youtube_subscriptions.to_json
      result = user.parse_subscriptions(json_string)
      expect(result.keys).to include("VICE")
    end
  end

  it 'should mark subscriptions as tracked' do
    user = User.create(name: "Jon Snow", email: "jsnow@whitewall.gov")
    user.youtube_subscriptions.create(title: "Example title", channel_id: "1234")
    user.youtube_subscriptions.create(title: "Another xample title", channel_id: "5678")
    channel_ids = ['1234', '5678']

    user.add_tracked_subscriptions(channel_ids)
    expect(user.youtube_subscriptions.first.tracked).to eq true
  end
end
