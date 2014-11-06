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


  it 'should have all youtube subscriptions' do
    VCR.use_cassette('subscriptions') do
      user = User.create(name: "Jon Snow", email: "jsnow@whitewall.gov")
      channel_id = "UC_R3-VJlFnDhlG_9hk-tZiQ"
      response = YoutubeAPI.get_subscriptions("user", channel_id)
      expect(user.subscriptions(response)).to be_an_instance_of Hash
      expect(user.subscriptions(response)).to eq({"Noisey"=>"UC0iwHRFpv2_fpojZgQhElEQ",
                                                  "VICE News"=>"UCZaT_X_mc0BI-djXOlfhqWQ",
                                                  "VICE"=>"UCn8zNIfYAQNdrFRrr8oibKw",
                                                  "Cook's Illustrated - Topic"=>"UCt7YulMv6FtTkUGBWqOK9KQ",
                                                  "Cook's Country - Topic"=>"UCTKpRucsWimjH6Ef43wQanA"})
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
