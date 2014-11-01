require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe 'PUT update' do
    it 'updates tracked_subsriptions' do
      user = User.create
      expect(user.tracked_subscriptions).to eq(nil)
      put :update
      expect(user.tracked_subscriptions).to be_an_instance_of Array
    end
  end

end
