require 'rails_helper'

describe "GET '/auth/twitter/callback'", type: :request do

  before(:each) do
    valid_twitter_login
    get "auth/twitter/callback"
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
  end

  it 'should create a user' do
    expect(User.last.name).to eq('Jon')
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
