require 'rails_helper'

RSpec.describe Api::UsersController, :type => :request do
  before(:each) do
    google_login_request
  end

  Sidekiq::Testing.fake!
  describe 'PUT update' do
    #currently not doing it in this way but I think we will be changing back to this
    xit 'adds tracked_subsriptions' do
      VCR.use_cassette('youtube/another_subscriptions') do
        user = User.last
        expect(user.tracked_subscriptions).to eq(nil)
        put "api/users/#{user.id}"
        user = User.find(user.id)
        expect(user.tracked_subscriptions).to be_an_instance_of Array
        expect(user.tracked_subscriptions[0]).to be_an_instance_of String
      end
    end
  end
end
