require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'should create user from omniauth hash' do
    hash = {'info' => {'first_name' => 'Jon'}}
    user = User.create_from_hash!(hash)
    expect(user.name).to eq('Jon')
  end

  it { should have_many(:identities) }
end
