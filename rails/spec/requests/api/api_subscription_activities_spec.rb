require 'rails_helper'

RSpec.describe "Api::SubscriptionActivities", :type => :request do
  describe "GET/api_subscription_activities" do
    before do 
      @user = User.create(name: "allie")
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user) { @user }
      @follower = User.create(name: "will")
      @user.subscriptions.create(followed_id: @follower.id)
      @follower.activities.create(provider: 'soundcloud', url: "music")
    end

    it 'retrieves followed activities' do 
      get api_subscription_activities_path
      expect(response.status).to eq(200)
      json = JSON.parse(response.body)
      expect(json['subscription_activities'].length).to eq(1)
      expect(json['subscription_activities'].first['url']).to eq('music')
    end
  end
end
