require 'rails_helper'

describe "GET '/auth/soundcloud/callback'", type: :request do

  before(:each) do
    soundcloud_login_request
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
