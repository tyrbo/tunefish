require 'rails_helper'

RSpec.describe "Api::V1::Users::Activities", :type => :request do
  describe "GET /api_v1_users_activities" do
    it "gets activities for a user" do
      user = User.create(name: "John Doe", photo: "example.com/img")
      activity1 = YoutubeActivity.create(user_id: user.id, provider: "youtube", url: "12345")
      activity2 = SoundcloudActivity.create(user_id: user.id, provider: "soundcloud", url: "56789")

      get api_v1_user_activities_path(user)
      expect(response.status).to be(200)
      json = JSON.parse(response.body)
      expect(json["activities"].length).to eq(2)
      expect(json["activities"].first["url"]).to eq("12345")
    end
  end
end
