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
    user = User.create(name: "Jon Snow", email: "jsnow@whitewall.gov")
    json = youtube_subscriptions.to_json
    expect(user.subscriptions(json)).to be_an_instance_of Hash
    expect(user.subscriptions(json)).to eq({"America's Test Kitchen" => "UCxAS_aK7sS2x_bqnlJHDSHw",
                                            "Cook's Illustrated - Topic" => "UCt7YulMv6FtTkUGBWqOK9KQ",
                                            "Munchies" => "UCaLfMkkHhSA_LaCta0BzyhQ",
                                            "Noisey" => "UC0iwHRFpv2_fpojZgQhElEQ",
                                            "VICE" => "UCn8zNIfYAQNdrFRrr8oibKw"})
  end

  it 'should have tracked subscriptions' do
    user = User.create(name: "Jon Snow", email: "jsnow@whitewall.gov")
    json = selected_subscriptions
    user.add_tracked_subscriptions(selected_subscriptions)
    expect(user.tracked_subscriptions).to be_an_instance_of Array
    expect(user.tracked_subscriptions).to eq(["UCxAS_aK7sS2x_bqnlJHDSHw", "UCn8zNIfYAQNdrFRrr8oibKw"])
  end
end
