require 'rails_helper'

describe "GET '/auth/soundcloud/callback'", type: :request do

  before(:each) do
    valid_soundcloud_login
    get "auth/soundcloud/callback"
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:soundcloud]
  end

  it 'should create a user' do
    expect(User.last.name).to eq('Daenerys')
  end

  it "should set user_id" do
    expect(session[:user_id]).to eq(User.last.id)
  end

  xit "should redirect to root" do
    expect(response).to redirect_to root_path
  end
end

describe "GET '/auth/failure'" do

  xit "should redirect to root" do
    get "/auth/failure"
    expect(response).to redirect_to root_path
  end
end
