require 'rails_helper'

RSpec.describe "Api::Subscriptions", :type => :request do
  describe "GET/api_subscriptions" do
    before do
      @user = User.create(name: "allie")
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user) { @user }
      @follower = User.create(name: "will")
      @user.subscriptions.create(followed_id: @follower.id )
    end

    it 'should follow another user' do
      new_follower = User.create(name: 'hilary')
      post api_subscriptions_path subscription: { follower_id: @user.id, followed_id: new_follower.id }
      expect(response.status).to eq(200)
      expect(@user.following.length).to eq(2)
    end

    it 'should unfollow a user' do
      delete api_subscription_path  id: @user.id, subscription: { follower_id: @user.id, followed_id: @follower.id }
      expect(response.status).to eq(200)
      expect(@user.following.length).to eq(0)
    end
  end
end
