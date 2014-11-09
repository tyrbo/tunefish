require 'rails_helper'

RSpec.describe "Api::YoutubeSubscriptions", :type => :request do
  describe "GET /api_youtube_subscriptions" do
    before do
      @user = User.create(name: "jon snow", email: "ohn@example.com")
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user) { @user }

      2.times do
        @user.youtube_subscriptions.create(channel_id: "12345", title: "A title")
      end
    end

    it "should retrieve a list of youtube subscriptions for a user" do
      get api_youtube_subscriptions_path
      expect(response.status).to be(200)
      json = JSON.parse(response.body)
      expect(json['youtube_subscriptions'].length). to eq(2)
    end
  end
end
