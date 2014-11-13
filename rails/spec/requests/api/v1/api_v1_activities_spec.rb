require 'rails_helper'

RSpec.describe "Api::V1::Activities", :type => :request do
  describe "GET /api_v1_activities" do
    it "retrieves all activities" do
      activity1 = YoutubeActivity.create(provider: "youtube", url: "12345")
      activity1 = TwitterActivity.create(provider: "twitter", url: "56789")
      activity1 = SoundcloudActivity.create(provider: "soundcloud", url: "02134")
      get api_v1_activities_path
      expect(response.status).to be(200)
      json = JSON.parse(response.body)
      expect(json['activities'].length).to eq(3)
    end
  end
end
