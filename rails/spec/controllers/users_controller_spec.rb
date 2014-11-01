require 'rails_helper'

RSpec.describe Api::UsersController, :type => :request do
  describe 'PUT update' do
    it 'adds tracked_subsriptions' do
      user = User.create
      expect(user.tracked_subscriptions).to eq(nil)
      put "api/users/#{user.id}"
      expect(user.tracked_subscriptions).to be_an_instance_of Array
    end
  end
end
