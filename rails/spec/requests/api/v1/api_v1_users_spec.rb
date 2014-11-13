require 'rails_helper'

RSpec.describe "Api::V1::Users", :type => :request do
  describe "GET /api_v1_users" do
    it "gets a list of users" do
      user1 = User.create(name: "John Doe", photo: "example.com/img")
      user2 = User.create(name: "Jane Doe", photo: "example.com/img2")

      get api_v1_users_path
      expect(response.status).to eq(200)
      json = JSON.parse(response.body)
      expect(json['users'].length).to eq(2)
    end
  end

  describe "GET /api_v1_user" do
    it "gets a single user" do
      user1 = User.create(name: "John Doe", photo: "example.com/img")

      get api_v1_user_path(user1.id)
      expect(response.status).to eq(200)
      json = JSON.parse(response.body)
      expect(json['user']['name']).to eq('John Doe')
    end
  end
end
