require 'rails_helper'

describe SessionsController, type: :request do

  before do
    VCR.use_cassette('youtube/login_subscriptions') do
      google_login_request
    end
  end

  it 'creates a new identity if first time login' do
    expect(User.last.name).to eq('Ned')
    expect(Identity.last.user).to eq(User.last)
  end

  it 'adds identity to user if already logged in' do
    twitter_login_request
    expect(User.last.name).to eq('Ned')
    expect(Identity.last.user).to eq(User.last)
  end
end
