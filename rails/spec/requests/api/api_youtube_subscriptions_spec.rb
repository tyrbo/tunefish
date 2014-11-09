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
      expect(response.status).to eq(200)
      json = JSON.parse(response.body)
      expect(json['youtube_subscriptions'].length). to eq(2)
    end
  end

  # describe "PATCH api/youtube_subscriptions/:id" do
  #   it "updates tracked status for a subscription" do
  #     youtube_subscription = YoutubeSubscription.create(channel_id: "12345", title: "A title")
  #     patch api_youtube_subscription_path(youtube_subscription.id)
  #     expect(response.status).to eq(200)
  #     expect(youtube_subscription.tracked). to eq(true)
  #   end
  # end
end
