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

  it { should serialize(:tracked_subscriptions) }

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

  it 'should have tracked subscriptions' do
    user = User.create(name: "Jon Snow", email: "jsnow@whitewall.gov")
    json = selected_subscriptions
    user.add_tracked_subscriptions(selected_subscriptions)
    expect(user.tracked_subscriptions).to be_an_instance_of Array
    expect(user.tracked_subscriptions).to eq(["UCxAS_aK7sS2x_bqnlJHDSHw", "UCn8zNIfYAQNdrFRrr8oibKw"])
  end
end
