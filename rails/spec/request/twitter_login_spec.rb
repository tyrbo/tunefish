require 'rails_helper'

describe "GET '/auth/twitter/callback'", type: :request do

  before(:each) do
    twitter_login_request
  end

  it 'should create a user' do
    expect(User.last.name).to eq('Jon')
  end

  it "should set user_id" do
    expect(session[:user_id]).to eq(User.last.id)
  end
end
